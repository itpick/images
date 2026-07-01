{ mkImage, pkgs, lib, ... }:

# clickhouse-nixchart
# Container image packaging nixpkgs.clickhouse
mkImage {
  drv = pkgs.clickhouse;
  name = "clickhouse-nixchart";
  tag = "v${pkgs.clickhouse.version}";
  entrypoint = [ (lib.getExe pkgs.clickhouse) ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "clickhouse-nixchart";
    "org.opencontainers.image.description" = "clickhouse-nixchart container image (nixpkgs.clickhouse)";
    "org.opencontainers.image.version" = pkgs.clickhouse.version;
    "io.nix-containers.source" = "nixpkgs";
  };
}
