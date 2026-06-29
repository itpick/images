{ mkImage, pkgs, lib, ... }:

# clickhouse-iamguarded
# Container image packaging nixpkgs.clickhouse
mkImage {
  drv = pkgs.clickhouse;
  name = "clickhouse-iamguarded";
  tag = "v${pkgs.clickhouse.version}";
  entrypoint = [ (lib.getExe pkgs.clickhouse) ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "clickhouse-iamguarded";
    "org.opencontainers.image.description" = "clickhouse-iamguarded container image (nixpkgs.clickhouse)";
    "org.opencontainers.image.version" = pkgs.clickhouse.version;
    "io.nix-containers.source" = "nixpkgs";
  };
}
