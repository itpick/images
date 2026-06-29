{ mkImage, pkgs, lib, ... }:

# clickhouse-fips
# Container image packaging nixpkgs.clickhouse
mkImage {
  drv = pkgs.clickhouse;
  name = "clickhouse-fips";
  tag = "v${pkgs.clickhouse.version}";
  entrypoint = [ (lib.getExe pkgs.clickhouse) ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "clickhouse-fips";
    "org.opencontainers.image.description" = "clickhouse-fips container image (nixpkgs.clickhouse)";
    "org.opencontainers.image.version" = pkgs.clickhouse.version;
    "io.nix-containers.source" = "nixpkgs";
  };
}
