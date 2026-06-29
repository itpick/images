{ mkImage, pkgs, lib, ... }:

# Prometheus SQL Exporter - https://github.com/burningalchemist/sql_exporter
let
  version = "0.24.1";
  drv = pkgs.stdenv.mkDerivation {
    pname = "sql_exporter";
    inherit version;
    src = pkgs.fetchurl {
      url = "https://github.com/burningalchemist/sql_exporter/releases/download/${version}/sql_exporter-${version}.linux-amd64.tar.gz";
      hash = "sha256:19sxwpndskm7361bp7fhwz2vsb2zm4jlx52h13f5vbv5gyc2yw29";
    };
    nativeBuildInputs = [ pkgs.autoPatchelfHook ];
    buildInputs = [ pkgs.stdenv.cc.cc.lib ];
    sourceRoot = "sql_exporter-${version}.linux-amd64";
    installPhase = ''
      runHook preInstall
      install -Dm755 sql_exporter $out/bin/sql_exporter
      runHook postInstall
    '';
  };
in mkImage {
  inherit drv;
  name = "sql_exporter";
  tag = "v${version}";
  entrypoint = [ "${drv}/bin/sql_exporter" ];
  cmd = [ "--help" ];
  labels = {
    "org.opencontainers.image.title" = "sql_exporter";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.source" = "upstream-binary";
  };
}
