# Istio - Service Mesh Platform
# https://github.com/istio/istio
#
# This package builds the main Istio components:
# - pilot-discovery: The control plane component (istiod) - built from source
# - pilot-agent: Sidecar agent for managing Envoy - built from source
# - proxyv2-bin: Pre-built pilot-agent + envoy from official Istio image
#   (Envoy doesn't build on aarch64-linux in nixpkgs due to bazel issues)

{ lib, fetchFromGitHub, buildGoModule, symlinkJoin, fetchurl, stdenv, autoPatchelfHook, glibc }:

let
  version = "1.28.1";

  src = fetchFromGitHub {
    owner = "istio";
    repo = "istio";
    rev = version;
    hash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";
  };

  commonAttrs = {
    inherit version src;
    env = {
      CGO_ENABLED = "0";
      GOGC = "50";
      GOMEMLIMIT = "3GiB";
    };
    doCheck = false;
    meta = with lib; {
      description = "Istio service mesh";
      homepage = "https://istio.io";
      license = licenses.asl20;
    };
  };

  ldflags = [
    "-s" "-w"
    "-X istio.io/istio/pkg/version.buildVersion=${version}"
    "-X istio.io/istio/pkg/version.buildStatus=Clean"
  ];

  # pilot-discovery (istiod control plane) - built from source
  pilot-discovery = buildGoModule (commonAttrs // {
    pname = "pilot-discovery";
    subPackages = [ "pilot/cmd/pilot-discovery" ];
    proxyVendor = true;
    vendorHash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";
    inherit ldflags;
  });

  # pilot-agent (sidecar agent) - built from source
  pilot-agent-src = buildGoModule (commonAttrs // {
    pname = "pilot-agent";
    subPackages = [ "pilot/cmd/pilot-agent" ];
    proxyVendor = true;
    vendorHash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";
    inherit ldflags;
  });

  # Pre-built proxyv2 binaries from official Istio Docker image
  # Extracted from docker.io/istio/proxyv2:1.24.0 arm64
  # Contains: pilot-agent, envoy
  proxyv2-bin = stdenv.mkDerivation {
    pname = "istio-proxyv2-bin";
    inherit version;

    # Binaries and config extracted from docker.io/istio/proxyv2:1.24.0 arm64
    # Pre-added to nix store
    src = /nix/store/mdrk404c2vf0g7pgg31gm97iczfxgk5s-istio-proxyv2-bins-1.24.0-aarch64-v2.tar.gz;

    nativeBuildInputs = lib.optionals stdenv.isLinux [ autoPatchelfHook ];
    buildInputs = lib.optionals stdenv.isLinux [ glibc stdenv.cc.cc.lib ];

    sourceRoot = ".";

    installPhase = ''
      runHook preInstall
      mkdir -p $out/bin $out/usr/local/bin $out/var/lib/istio/envoy

      # Install binaries
      cp usr/local/bin/envoy $out/bin/
      cp usr/local/bin/pilot-agent $out/bin/
      chmod +x $out/bin/*

      # Create symlinks in /usr/local/bin (where pilot-agent expects them)
      ln -s $out/bin/envoy $out/usr/local/bin/envoy
      ln -s $out/bin/pilot-agent $out/usr/local/bin/pilot-agent

      # Install bootstrap template
      cp var/lib/istio/envoy/envoy_bootstrap_tmpl.json $out/var/lib/istio/envoy/

      ls -la $out/bin/
      ls -la $out/usr/local/bin/
      ls -la $out/var/lib/istio/envoy/
      runHook postInstall
    '';

    meta = with lib; {
      description = "Istio proxyv2 binaries (envoy + pilot-agent)";
      homepage = "https://istio.io";
      license = licenses.asl20;
      platforms = [ "aarch64-linux" "x86_64-linux" ];
    };
  };

in symlinkJoin {
  name = "istio-${version}";
  paths = [ pilot-discovery pilot-agent-src ];
  passthru = {
    inherit version pilot-discovery proxyv2-bin;
    pilot-agent = pilot-agent-src;
  };
}
