{ mkImage, pkgs, lib, ... }:

# Istio Envoy - the Envoy proxy build used by Istio's data plane.
# Prebuilt binary published to the istio-build GCS bucket, keyed by the
# proxy SHA pinned in istio/istio's istio.deps for the release.
# https://github.com/istio/proxy

let
  version = "1.30.2";
  proxySha = "34ce4554c88740f88bfc4dc826ae33e1dd21d8fc";

  drv = pkgs.stdenv.mkDerivation {
    pname = "istio-envoy";
    inherit version;

    src = pkgs.fetchurl {
      url = "https://storage.googleapis.com/istio-build/proxy/envoy-alpha-${proxySha}.tar.gz";
      hash = "sha256-UG+3+9hpahF3gARUZKeR7dx0ND1kz9iYct0HugKMfVU=";
    };

    nativeBuildInputs = [ pkgs.autoPatchelfHook ];

    buildInputs = with pkgs; [
      stdenv.cc.cc.lib
      zlib
    ];

    sourceRoot = ".";

    installPhase = ''
      runHook preInstall
      install -Dm755 usr/local/bin/envoy $out/bin/envoy
      runHook postInstall
    '';

    dontStrip = true;
  };

in mkImage {
  inherit drv;
  name = "istio-envoy";
  tag = "v${version}";
  entrypoint = [ "${drv}/bin/envoy" ];
  cmd = [ "--version" ];

  labels = {
    "org.opencontainers.image.title" = "istio-envoy";
    "org.opencontainers.image.description" = "Envoy proxy build used by Istio";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.source" = "upstream-binary";
  };
}
