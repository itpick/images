{ mkImage, pkgs, lib, ... }:

# promxy-fips - same upstream promxy tool (Prometheus proxy)
# https://github.com/jacksontj/promxy

let
  version = "0.0.95";

  drv = pkgs.stdenv.mkDerivation {
    pname = "promxy-fips";
    inherit version;

    src = pkgs.fetchurl {
      url = "https://github.com/jacksontj/promxy/releases/download/v${version}/promxy-v${version}-linux-amd64";
      hash = "sha256-cFvJiTU1M/esS04pyp7TiXo1doq0hd7Zbu4cLWN8apY=";
    };

    nativeBuildInputs = [ pkgs.autoPatchelfHook ];
    buildInputs = [ pkgs.stdenv.cc.cc.lib ];

    dontUnpack = true;

    installPhase = ''
      runHook preInstall
      install -Dm755 $src $out/bin/promxy
      runHook postInstall
    '';
  };
in mkImage {
  inherit drv;
  name = "promxy-fips";
  tag = "v${version}";
  entrypoint = [ "${drv}/bin/promxy" ];
  cmd = [ "--help" ];
  labels = {
    "org.opencontainers.image.title" = "promxy-fips";
    "org.opencontainers.image.description" = "Prometheus proxy aggregating multiple Prometheus servers";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.source" = "upstream-binary";
  };
}
