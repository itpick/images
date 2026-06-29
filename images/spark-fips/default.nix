{ mkImage, pkgs, lib, ... }:

# spark-fips
# Container image packaging nixpkgs.spark
mkImage {
  drv = pkgs.spark;
  name = "spark-fips";
  tag = "v${pkgs.spark.version}";
  entrypoint = [ (lib.getExe pkgs.spark) ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "spark-fips";
    "org.opencontainers.image.description" = "spark-fips container image (nixpkgs.spark)";
    "org.opencontainers.image.version" = pkgs.spark.version;
    "io.nix-containers.source" = "nixpkgs";
  };
}
