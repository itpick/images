{ mkImage, pkgs, lib, ... }:

# SQLite command-line tools - https://sqlite.org
let
  version = "3.53.3";
  drv = pkgs.stdenv.mkDerivation {
    pname = "sqlite3";
    inherit version;
    src = pkgs.fetchurl {
      url = "https://sqlite.org/2026/sqlite-tools-linux-x64-3530300.zip";
      hash = "sha256:1xkk5b1k3wanss2448gy17mljcnh1v0r2rpwjgqw847hvya0v6h8";
    };
    nativeBuildInputs = [ pkgs.autoPatchelfHook pkgs.unzip ];
    buildInputs = [ pkgs.stdenv.cc.cc.lib pkgs.zlib ];
    sourceRoot = ".";
    installPhase = ''
      runHook preInstall
      install -Dm755 sqlite3 $out/bin/sqlite3
      runHook postInstall
    '';
  };
in mkImage {
  inherit drv;
  name = "sqlite3";
  tag = "v${version}";
  entrypoint = [ "${drv}/bin/sqlite3" ];
  cmd = [ "--version" ];
  labels = {
    "org.opencontainers.image.title" = "sqlite3";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.source" = "upstream-binary";
  };
}
