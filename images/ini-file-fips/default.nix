{ mkImage, pkgs, lib, ... }:

# Bitnami ini-file CLI (fips variant -> same upstream binary)
# https://github.com/bitnami/ini-file

let
  version = "1.4.9";

  drv = pkgs.stdenv.mkDerivation {
    pname = "ini-file";
    inherit version;

    src = pkgs.fetchurl {
      url = "https://github.com/bitnami/ini-file/releases/download/v${version}/ini-file-linux-amd64.tar.gz";
      hash = "sha256-Z9WOffuHdyIzgSDDSPSW+YvFY+k5uim6URECXj3O+WM=";
    };

    nativeBuildInputs = [ pkgs.autoPatchelfHook ];
    buildInputs = [ pkgs.stdenv.cc.cc.lib ];

    sourceRoot = ".";

    installPhase = ''
      runHook preInstall
      install -Dm755 ini-file-linux-amd64 $out/bin/ini-file
      runHook postInstall
    '';
  };
in mkImage {
  inherit drv;
  name = "ini-file-fips";
  tag = "v${version}";
  entrypoint = [ "${drv}/bin/ini-file" ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "ini-file-fips";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.source" = "upstream-binary";
  };
}
