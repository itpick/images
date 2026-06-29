{ mkImage, pkgs, lib, ... }:

# Cortex - horizontally scalable, multi-tenant Prometheus-as-a-service
# https://github.com/cortexproject/cortex
# Note: packages the upstream cortex linux/amd64 binary; no FIPS certification claimed.

let
  version = "1.21.1";

  drv = pkgs.stdenv.mkDerivation {
    pname = "cortex-fips";
    inherit version;

    src = pkgs.fetchurl {
      url = "https://github.com/cortexproject/cortex/releases/download/v${version}/cortex-linux-amd64";
      hash = "sha256-mT+No9TJnZ+4K14mNpUCwaes9MK5XkuHGQ5gjNtXxkk=";
    };

    nativeBuildInputs = [ pkgs.autoPatchelfHook ];
    buildInputs = [ pkgs.stdenv.cc.cc.lib ];

    dontUnpack = true;

    installPhase = ''
      runHook preInstall
      install -Dm755 $src $out/bin/cortex
      runHook postInstall
    '';
  };
in mkImage {
  inherit drv;
  name = "cortex-fips";
  tag = "v${version}";
  entrypoint = [ "${drv}/bin/cortex" ];
  cmd = [ "--help" ];
  labels = {
    "org.opencontainers.image.title" = "cortex-fips";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.source" = "upstream-binary";
  };
}
