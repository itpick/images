{ mkImage, pkgs, lib, ... }:

# ClickHouse Keeper - ZooKeeper-compatible coordination service for ClickHouse
# https://github.com/ClickHouse/ClickHouse
let
  version = "26.5.4.21";

  drv = pkgs.stdenv.mkDerivation {
    pname = "clickhouse-keeper";
    inherit version;

    src = pkgs.fetchurl {
      url = "https://packages.clickhouse.com/tgz/stable/clickhouse-keeper-${version}-amd64.tgz";
      hash = "sha256-MhUaBqv4TE+HgCEyhVC2dMt3fEK5jZFByq2tCu0aiz0=";
    };

    nativeBuildInputs = [ pkgs.autoPatchelfHook ];
    buildInputs = [ pkgs.stdenv.cc.cc.lib ];

    sourceRoot = "clickhouse-keeper-${version}";

    dontStrip = true;

    installPhase = ''
      runHook preInstall
      install -Dm755 usr/bin/clickhouse-keeper $out/bin/clickhouse-keeper
      ln -s clickhouse-keeper $out/bin/clickhouse-keeper-client
      ln -s clickhouse-keeper $out/bin/clickhouse-keeper-converter
      runHook postInstall
    '';
  };
in mkImage {
  inherit drv;
  name = "clickhouse-keeper";
  tag = "v${version}";
  entrypoint = [ "${drv}/bin/clickhouse-keeper" ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "clickhouse-keeper";
    "org.opencontainers.image.description" = "ZooKeeper-compatible coordination service for ClickHouse";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.source" = "upstream-binary";
  };
}
