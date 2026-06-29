{ mkImage, pkgs, lib, ... }:

# grype-db - builds the vulnerability database used by grype
# https://github.com/anchore/grype-db

let
  version = "0.54.1";

  drv = pkgs.stdenv.mkDerivation {
    pname = "grype-db";
    inherit version;

    src = pkgs.fetchurl {
      url = "https://github.com/anchore/grype-db/releases/download/v${version}/grype-db_${version}_linux_amd64.tar.gz";
      hash = "sha256:07yrg3y1cb3acjcvl3r9xas0p96k2ravi8y8np7s03xi7vpmyymn";
    };

    nativeBuildInputs = [ pkgs.autoPatchelfHook ];
    buildInputs = [ pkgs.stdenv.cc.cc.lib ];

    sourceRoot = ".";

    installPhase = ''
      runHook preInstall
      install -Dm755 grype-db $out/bin/grype-db
      runHook postInstall
    '';
  };
in mkImage {
  inherit drv;
  name = "grype-db";
  tag = "v${version}";
  entrypoint = [ "${drv}/bin/grype-db" ];
  cmd = [ "--help" ];
  labels = {
    "org.opencontainers.image.title" = "grype-db";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.source" = "upstream-binary";
  };
}
