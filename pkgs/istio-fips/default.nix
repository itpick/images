# istio-fips - Istio Go control-plane components built with BoringCrypto
# https://github.com/istio/istio
#
# WHY THIS EXISTS SEPARATELY FROM pkgs/istio. pkgs/istio extracts prebuilt
# binaries out of the official Istio release images, which are stock upstream
# builds using Go's default crypto. Extraction can never produce a FIPS
# artifact, so a -fips variant sourced that way is a name and nothing more.
# This package builds from istio/istio source with CGO_ENABLED=1 and
# GOEXPERIMENT=boringcrypto, the same mechanism the 286 genuinely-qualifying
# -fips images here use (see pkgs/cert-manager-fips).
#
# SCOPE. pilot-discovery (istiod) and pilot-agent are pure Go, so boringcrypto
# applies. The Envoy data plane is C++ and cannot be built this way; it is a
# separate Bazel build linked against the CMVP #5314 AWS-LC FIPS 3.1.0 module
# (see `envoy` below), fetched as a hash-pinned release asset.
#
# Verify a build with:
#   go version -m result/bin/pilot-discovery | grep GOEXPERIMENT
# which must report boringcrypto. A binary without that line is not a FIPS
# build regardless of what the derivation is called.

{ lib, fetchFromGitHub, buildGoModule, fetchurl, stdenvNoCC, autoPatchelfHook, zlib, stdenv, runCommand, cacert
, elfutils, libpcap, iptables, libbpf, iproute2 }:

let
  version = "1.31.4";

  # PROXY_REPO_SHA from istio/istio istio.deps at tag 1.31.4 (Envoy 1.39.7-dev,
  # envoyproxy/envoy 8893f913).
  proxySha = "defdcd65d0c035b54b324dc6ed4ef258e22bf94d";

  src = fetchFromGitHub {
    owner = "istio";
    repo = "istio";
    # refs/tags/: istio/istio has both a branch and a tag named 1.31.4, so the
    # bare-ref archive URL is ambiguous and GitHub returns an error page.
    rev = "refs/tags/${version}";
    hash = "sha256-PYzR97GLahmOHQYFsLCjQ16jZjZuVUXO3LH085iFsNw=";
  };

  commonAttrs = {
    inherit version src;
    # CGO must be on: boringcrypto swaps Go's crypto for cgo calls into
    # BoringCrypto, so CGO_ENABLED=0 silently produces a NON-FIPS binary while
    # still accepting the GOEXPERIMENT flag.
    env.CGO_ENABLED = 1;
    env.GOEXPERIMENT = "boringcrypto";
    doCheck = false;
    meta = with lib; {
      homepage = "https://istio.io/";
      license = licenses.asl20;
      platforms = platforms.linux;
    };
  };

in
rec {
  inherit version src;

  pilot-discovery = buildGoModule (commonAttrs // {
    pname = "pilot-discovery-fips";
    vendorHash = "sha256-aG3aG+0E4roSFVX+0s3WI8Gt1SuSf6MArauiOJv+6r0=";
    subPackages = [ "pilot/cmd/pilot-discovery" ];
    ldflags = [
      "-s" "-w"
      "-X istio.io/istio/pkg/version.buildVersion=${version}"
      "-X istio.io/istio/pkg/version.buildStatus=Clean"
    ];
    meta = commonAttrs.meta // {
      description = "Istio control plane (istiod), BoringCrypto build";
      mainProgram = "pilot-discovery";
    };
  });

  pilot-agent = buildGoModule (commonAttrs // {
    pname = "pilot-agent-fips";
    vendorHash = "sha256-aG3aG+0E4roSFVX+0s3WI8Gt1SuSf6MArauiOJv+6r0=";
    subPackages = [ "pilot/cmd/pilot-agent" ];
    ldflags = [
      "-s" "-w"
      "-X istio.io/istio/pkg/version.buildVersion=${version}"
    ];
    meta = commonAttrs.meta // {
      description = "Istio sidecar agent, BoringCrypto build";
      mainProgram = "pilot-agent";
    };
  });

  # AWS-LC-FIPS Envoy, fetched by hash from a GitHub release.
  #
  # WHY NOT BUILT HERE. This is a ~60 minute Bazel build that needs network
  # access mid-build and its own clang/cmake/ninja/go toolchain, so it cannot
  # run in a nix derivation. scripts/build-istio-envoy-fips.sh is the exact
  # recipe and regenerates this artifact; the hash below pins it, so the IMAGE
  # stays reproducible from git even though the binary is a documented input.
  #
  # WHY NOT UPSTREAM ENVOY. Istio's data plane needs istio/proxy's build — the
  # bootstrap requires type.googleapis.com/istio.workload.BootstrapExtension and
  # the binary must carry io.istio.http.peer_metadata, io.istio.local_principal
  # and io.istio.peer_principal. Chainguard's envoy-fips is upstream Envoy and
  # rejects Istio's config; Google's ASM ships no FIPS variant; Tetrate's is
  # subscription-gated. Nothing publishes a FIPS Envoy Istio can use.
  #
  # THE MODULE. TLS crypto is the AWS-LC 3 Cryptographic Module (static),
  # version AWS-LC FIPS 3.1.0, NIST CMVP certificate #5314 (FIPS 140-3 L1,
  # Active, sunset 2031-06-04). libcrypto.a/libssl.a are built outside Bazel
  # exactly as Security Policy section 11.1 prescribes (Amazon Linux 2023,
  # "cmake3 -DFIPS=1 .. && make", from the unmodified AWS-LC-FIPS-3.1.0.zip,
  # sha256 fe408fa4...c9f1, `bssl isfips` = 1) and linked statically into
  # istio/proxy defdcd65 (istio 1.31.4's pin) with --config=aws-lc-fips.
  # Reports:
  #   defdcd65.../1.39.7-dev/Modified/RELEASE/AWS-LC-FIPS
  # and `nm envoy | grep awslc_version_string` shows T (statically linked).
  #
  # FIPS_202205 COMPLIANCE POLICY. AWS-LC has no SSL_CTX_set_compliance_policy,
  # and Envoy's AWS-LC compat shim stubs it to FAIL, which would reject any
  # listener carrying compliance_policies: [FIPS_202205]. The build applies a
  # small Envoy-only patch (scripts/istio-envoy-awslc-fips/0014-*.patch; the
  # module is untouched) that implements the policy with public AWS-LC APIs:
  # TLS >= 1.2, TLS 1.2 ECDHE-*-AES-GCM only, TLS 1.3 AES-GCM only (no
  # ChaCha20), P-256/P-384 only, no SHA-1/Ed25519 signatures. Not emulated:
  # AWS-LC cannot REQUIRE extended master secret.
  #
  # OPERATIONAL ENVIRONMENT. #5314's tested OE is Amazon Linux 2023 on
  # c6i.metal / r8g.metal-24xl; no vendor-affirmed OEs. Running on GKE
  # (Container-Optimized OS, x86_64) rests on USER affirmation under the
  # FIPS 140-3 Management Manual 7.9.2 ("another compatible operating
  # system"). CMVP makes no statement about operation on unlisted OEs.
  #
  # autoPatchelfHook IS LOAD-BEARING. The Bazel build emits a binary requesting
  # /lib64/ld-linux-x86-64.so.2, absent in a nix image. Without patching,
  # pilot-agent fails with "fork/exec /usr/local/bin/envoy: no such file or
  # directory" — ENOENT for the missing INTERPRETER, not the missing file, which
  # is thoroughly misleading. Patching rewrites the ELF interpreter/RPATH only;
  # the module's integrity check covers its own .text and still passes (Envoy
  # aborts at startup if the FIPS power-on self-test fails).
  envoy = stdenv.mkDerivation {
    pname = "istio-envoy-awslc-fips";
    inherit version;

    src = fetchurl {
      # One release tag per istio version; the 1.30.4 assets (AWS-LC and
      # BoringSSL-FIPS) are left untouched.
      url = "https://github.com/nix-containers/images/releases/download/istio-envoy-awslc-fips-${version}/istio-envoy-awslc-fips-3.1.0-${proxySha}.gz";
      # Built by scripts/build-istio-envoy-fips.sh at 3f131340f (Envoy patches
      # 0014-0017); binary sha256
      # 332766762611079856fe459ede27074ae3811bc4fe1f6a292db1531b018a43d1.
      hash = "sha256-2zrBp9BwgCD+1cOZwN9tSkOL9Ww0iFJfdbI9xVph3K4=";
    };

    nativeBuildInputs = [ autoPatchelfHook ];
    buildInputs = [ stdenv.cc.cc.lib zlib ];

    unpackPhase = "true";
    installPhase = ''
      runHook preInstall
      mkdir -p $out/bin
      gzip -dc $src > $out/bin/envoy
      chmod 755 $out/bin/envoy
      runHook postInstall
    '';
    dontStrip = true;
  };

  # Minimal iptables / iproute2 for the istio images.
  #
  # WHY. The stock nixpkgs builds pull two optional dependency chains that no
  # istio component ever exercises, and both carried unpatched Critical CVEs
  # into istio-proxyv2-fips 1.30.4 (grype, 2026-11-08):
  #   iptables -> libpcap (withRdma) -> rdma-core -> perl
  #       perl CVE-2026-13221 (Critical, no fix)
  #   iproute2, libbpf -> elfutils (debuginfod) -> curl -> openssl, libssh2, krb5
  #       libssh2 CVE-2026-7598 (Critical, no fix), openssl CVE-2026-63073 /
  #       CVE-2026-75803 (Critical), plus a dozen Highs across the three.
  # istio-iptables only needs the xtables binaries; `ip` only needs netlink.
  # RDMA packet capture (nfbpf_compile's libpcap) and debuginfod symbol fetching
  # are dead weight, so they are switched off rather than patched around.
  elfutilsMin = elfutils.override { enableDebuginfod = false; };
  libpcapMin = libpcap.override { withRdma = false; };
  iptablesMin = iptables.override { libpcap = libpcapMin; };
  iproute2Min = iproute2.override {
    iptables = iptablesMin;
    elfutils = elfutilsMin;
    libbpf = libbpf.override { elfutils = elfutilsMin; };
  };

  # OS CA bundle under the filename istio actually probes.
  #
  # pilot-agent calls security.GetOSRootFilePath(), which stats a fixed list of
  # distro paths and takes the first hit:
  #   /etc/ssl/certs/ca-certificates.crt   (Debian/Ubuntu — first, so this one)
  #   /etc/pki/tls/certs/ca-bundle.crt, /etc/ssl/ca-bundle.pem, ... (7 more)
  # nixpkgs cacert installs the bundle as /etc/ssl/certs/ca-bundle.crt, which
  # matches NONE of them — note the second candidate IS ca-bundle.crt but under
  # /etc/pki/tls/certs, not /etc/ssl/certs. So the bundle was present all along
  # under a name istio never looks for, and every proxy logged
  #   warn  OS CA Cert could not be found for agent
  # while upstream proxyv2, being Debian-based, did not.
  #
  # Inert on our clusters today — nothing makes the proxy fetch remote JWKS over
  # TLS (no RequestAuthentication, no jwt_authn filter, and the ext_authz
  # provider is plaintext in-cluster gRPC) — but it is a real divergence from
  # upstream that would bite the moment a RequestAuthentication with a remote
  # jwksUri is added, and it would surface as a TLS verification error rather
  # than anything pointing back here.
  osCaCompat = runCommand "istio-os-ca-certificates" { } ''
    mkdir -p $out/etc/ssl/certs
    ln -s ${cacert}/etc/ssl/certs/ca-bundle.crt \
          $out/etc/ssl/certs/ca-certificates.crt
  '';

  # Combined image payload, mirroring pkgs/istio's proxyv2-bin layout:
  # binaries in /bin plus the /usr/local/bin symlinks pilot-agent looks for, and
  # the bootstrap template at the path Envoy is handed.
  #
  # pilot-agent is BoringCrypto (CMVP #4735); envoy links AWS-LC FIPS 3.1.0
  # (CMVP #5314). The gateway's external TLS is terminated by ENVOY.
  proxyv2-bin = stdenvNoCC.mkDerivation {
    pname = "istio-proxyv2-fips";
    inherit version;
    dontUnpack = true;
    installPhase = ''
      runHook preInstall
      mkdir -p $out/bin $out/usr/local/bin $out/var/lib/istio/envoy
      cp ${envoy}/bin/envoy $out/bin/
      cp ${pilot-agent}/bin/pilot-agent $out/bin/
      ln -s $out/bin/envoy $out/usr/local/bin/envoy
      ln -s $out/bin/pilot-agent $out/usr/local/bin/pilot-agent
      cp ${src}/tools/packaging/common/envoy_bootstrap.json \
         $out/var/lib/istio/envoy/envoy_bootstrap_tmpl.json
      runHook postInstall
    '';
    meta = with lib; {
      description = "Istio proxyv2 payload: BoringCrypto pilot-agent + AWS-LC-FIPS Envoy + bootstrap";
      homepage = "https://istio.io/";
      license = licenses.asl20;
      platforms = [ "x86_64-linux" ];
    };
  };
}
