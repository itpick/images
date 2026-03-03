# Istio - Service Mesh Platform
# https://github.com/istio/istio
#
# Extracts pre-built binaries from official Istio container images:
# - pilot-discovery: The control plane component (istiod)
# - pilot-agent: Sidecar agent for managing Envoy
# - envoy: The data plane proxy
#
# Using container images because:
# 1. Envoy doesn't build reliably in nixpkgs (bazel issues on aarch64)
# 2. Official images are the supported distribution method
# 3. Ensures binary compatibility with Istio's tested configurations

{ lib, stdenvNoCC, crane, cacert }:

let
  version = "1.28.1";

  arch = if stdenvNoCC.hostPlatform.isAarch64 then "arm64" else "amd64";

  # Layer digests for pilot image (contains pilot-discovery)
  pilotLayers = {
    amd64 = {
      digest = "sha256:b296c147f27e022a9998880c10443a5e0075fb4588ee9e215b0269867c37f4d7";
      hash = "sha256-qLUfkk0ALPSn4l/hS2GAR4k/H9zDO1qTo4H85aCUWhQ=";
    };
    arm64 = {
      digest = "sha256:4d44877f2282ccf41cac7d4256673c43182134773eb0afa6ed632841bba558d2";
      hash = "sha256-W4XQ2lNU0weVQ1mULdx7KByMgE/II2JbS6csaHh8VgE=";
    };
  };

  # Layer digests for proxyv2 image
  # Contains: pilot-agent, envoy, and bootstrap template
  proxyv2Layers = {
    amd64 = {
      # Layer with envoy binary
      envoy = {
        digest = "sha256:a8ee5b657fc82b9b8f596bb122577d1473d390862f3757de72f2258f8ec703df";
        hash = "sha256-bLOiL7L4R1vIDI7WpK/O1JJsGvTwki6VnReIE24cfvs=";
      };
      # Layer with bootstrap template
      bootstrap = {
        digest = "sha256:89c4282446c8d0a6988ab69c1255688c878749da57270b80586d475aee9c0b80";
        hash = "sha256-SK4kDjH7xN1AOscMa42aXBaeP42M0gwcrQRrE3mY1w8=";
      };
      # Layer with pilot-agent
      pilotAgent = {
        digest = "sha256:53ce041f5c3945c7674188abd8d11b7e7e4ea9c8e7c673b18074c5e6e994f22b";
        hash = "sha256-DPFLDvVu13g8WPnmohNFtfchil5vrvhFv4VskVIPj80=";
      };
    };
    arm64 = {
      envoy = {
        digest = "sha256:3992af213892f9500726ab11b05bebfb5550231ff9931c058513bdeeb0894987";
        hash = "sha256-G05xNcL4yhv2u9CFFTDP8S8QWf48sYt8xh/PjX40VzA=";
      };
      bootstrap = {
        digest = "sha256:be6f4fe9dbaf7038cfbe995ebfe936ca2010717d9ae2e5a65890466819f17ee7";
        hash = "sha256-SK4kDjH7xN1AOscMa42aXBaeP42M0gwcrQRrE3mY1w8=";
      };
      pilotAgent = {
        digest = "sha256:c074648e67d313e1651abda4b0894fe998264392aee6a3e6971db4abb3e257f4";
        hash = "sha256-+yJeaq3rkJSvPGgXqDuYGZHxMEgq1JA0h0aUpM7piGA=";
      };
    };
  };

  # pilot-discovery (istiod control plane)
  pilot-discovery = stdenvNoCC.mkDerivation {
    pname = "pilot-discovery";
    inherit version;

    dontUnpack = true;
    nativeBuildInputs = [ crane ];

    SSL_CERT_FILE = "${cacert}/etc/ssl/certs/ca-bundle.crt";

    buildPhase = ''
      runHook preBuild
      mkdir -p extract
      crane blob docker.io/istio/pilot:${version}@${pilotLayers.${arch}.digest} | tar -xz -C extract
      runHook postBuild
    '';

    installPhase = ''
      runHook preInstall
      mkdir -p $out/bin
      install -m755 extract/usr/local/bin/pilot-discovery $out/bin/pilot-discovery
      runHook postInstall
    '';

    preferLocalBuild = true;
    outputHashMode = "recursive";
    outputHashAlgo = "sha256";
    outputHash = pilotLayers.${arch}.hash;

    meta = with lib; {
      description = "Istio Pilot Discovery (istiod control plane)";
      homepage = "https://istio.io";
      license = licenses.asl20;
      mainProgram = "pilot-discovery";
      platforms = [ "x86_64-linux" "aarch64-linux" ];
    };
  };

  # pilot-agent (sidecar agent)
  pilot-agent = stdenvNoCC.mkDerivation {
    pname = "pilot-agent";
    inherit version;

    dontUnpack = true;
    nativeBuildInputs = [ crane ];

    SSL_CERT_FILE = "${cacert}/etc/ssl/certs/ca-bundle.crt";

    buildPhase = ''
      runHook preBuild
      mkdir -p extract
      crane blob docker.io/istio/proxyv2:${version}@${proxyv2Layers.${arch}.pilotAgent.digest} | tar -xz -C extract
      runHook postBuild
    '';

    installPhase = ''
      runHook preInstall
      mkdir -p $out/bin
      install -m755 extract/usr/local/bin/pilot-agent $out/bin/pilot-agent
      runHook postInstall
    '';

    preferLocalBuild = true;
    outputHashMode = "recursive";
    outputHashAlgo = "sha256";
    outputHash = proxyv2Layers.${arch}.pilotAgent.hash;

    meta = with lib; {
      description = "Istio Pilot Agent (sidecar agent)";
      homepage = "https://istio.io";
      license = licenses.asl20;
      mainProgram = "pilot-agent";
      platforms = [ "x86_64-linux" "aarch64-linux" ];
    };
  };

  # envoy proxy
  envoy = stdenvNoCC.mkDerivation {
    pname = "istio-envoy";
    inherit version;

    dontUnpack = true;
    nativeBuildInputs = [ crane ];

    SSL_CERT_FILE = "${cacert}/etc/ssl/certs/ca-bundle.crt";

    buildPhase = ''
      runHook preBuild
      mkdir -p extract
      crane blob docker.io/istio/proxyv2:${version}@${proxyv2Layers.${arch}.envoy.digest} | tar -xz -C extract
      runHook postBuild
    '';

    installPhase = ''
      runHook preInstall
      mkdir -p $out/bin
      install -m755 extract/usr/local/bin/envoy $out/bin/envoy
      runHook postInstall
    '';

    preferLocalBuild = true;
    outputHashMode = "recursive";
    outputHashAlgo = "sha256";
    outputHash = proxyv2Layers.${arch}.envoy.hash;

    meta = with lib; {
      description = "Istio Envoy Proxy";
      homepage = "https://istio.io";
      license = licenses.asl20;
      mainProgram = "envoy";
      platforms = [ "x86_64-linux" "aarch64-linux" ];
    };
  };

  # bootstrap config (envoy bootstrap template)
  bootstrap = stdenvNoCC.mkDerivation {
    pname = "istio-bootstrap";
    inherit version;

    dontUnpack = true;
    nativeBuildInputs = [ crane ];

    SSL_CERT_FILE = "${cacert}/etc/ssl/certs/ca-bundle.crt";

    buildPhase = ''
      runHook preBuild
      mkdir -p extract
      crane blob docker.io/istio/proxyv2:${version}@${proxyv2Layers.${arch}.bootstrap.digest} | tar -xz -C extract
      runHook postBuild
    '';

    installPhase = ''
      runHook preInstall
      mkdir -p $out/var/lib/istio/envoy
      cp extract/var/lib/istio/envoy/envoy_bootstrap_tmpl.json $out/var/lib/istio/envoy/
      runHook postInstall
    '';

    preferLocalBuild = true;
    outputHashMode = "recursive";
    outputHashAlgo = "sha256";
    outputHash = proxyv2Layers.${arch}.bootstrap.hash;

    meta = with lib; {
      description = "Istio Envoy bootstrap template";
      homepage = "https://istio.io";
      license = licenses.asl20;
      platforms = [ "x86_64-linux" "aarch64-linux" ];
    };
  };

  # proxyv2-bin: Combined package with pilot-agent, envoy, and bootstrap config
  # Uses symlinkJoin to combine the fixed-output derivations
  proxyv2-bin = stdenvNoCC.mkDerivation {
    pname = "istio-proxyv2";
    inherit version;

    dontUnpack = true;

    installPhase = ''
      runHook preInstall
      mkdir -p $out/bin $out/usr/local/bin $out/var/lib/istio/envoy

      # Copy binaries
      cp ${envoy}/bin/envoy $out/bin/
      cp ${pilot-agent}/bin/pilot-agent $out/bin/

      # Create symlinks in /usr/local/bin (where pilot-agent expects them)
      ln -s $out/bin/envoy $out/usr/local/bin/envoy
      ln -s $out/bin/pilot-agent $out/usr/local/bin/pilot-agent

      # Copy bootstrap template
      cp ${bootstrap}/var/lib/istio/envoy/envoy_bootstrap_tmpl.json $out/var/lib/istio/envoy/

      runHook postInstall
    '';

    meta = with lib; {
      description = "Istio proxyv2 binaries (envoy + pilot-agent + bootstrap)";
      homepage = "https://istio.io";
      license = licenses.asl20;
      platforms = [ "x86_64-linux" "aarch64-linux" ];
    };
  };

in {
  inherit version;

  # Individual components
  inherit pilot-discovery pilot-agent envoy bootstrap proxyv2-bin;

  # For backwards compatibility, the default package is pilot-discovery
  meta = with lib; {
    description = "Istio service mesh components";
    homepage = "https://istio.io";
    license = licenses.asl20;
    platforms = [ "x86_64-linux" "aarch64-linux" ];
  };
}
