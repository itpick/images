{ mkImage, pkgs, lib, ... }:

# Talos Image Factory - https://github.com/siderolabs/image-factory
# Upstream prebuilt linux/amd64 release binary.

let
  version = "1.3.3";

  drv = pkgs.stdenv.mkDerivation {
    pname = "image-factory";
    inherit version;

    src = pkgs.fetchurl {
      url = "https://github.com/siderolabs/image-factory/releases/download/v${version}/image-factory-linux-amd64";
      hash = "sha256-hIAzHu7+s45fMGkIQtdQe9aLapOS0ex/xU1oXZopuiA=";
    };

    dontUnpack = true;

    nativeBuildInputs = [ pkgs.autoPatchelfHook ];
    buildInputs = [ pkgs.stdenv.cc.cc.lib ];

    installPhase = ''
      runHook preInstall
      install -Dm755 $src $out/bin/image-factory
      runHook postInstall
    '';
  };
in mkImage {
  inherit drv;
  name = "image-factory-fips";
  tag = "v${version}";
  entrypoint = [ "${drv}/bin/image-factory" ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "image-factory-fips";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.source" = "upstream-binary";
  };
}
