{ mkImage, pkgs, lib, ... }:

# spark-iamguarded
# Container image packaging nixpkgs.spark
mkImage {
  drv = pkgs.spark;
  name = "spark-iamguarded";
  tag = "v${pkgs.spark.version}";
  entrypoint = [ (lib.getExe pkgs.spark) ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "spark-iamguarded";
    "org.opencontainers.image.description" = "spark-iamguarded container image (nixpkgs.spark)";
    "org.opencontainers.image.version" = pkgs.spark.version;
    "io.nix-containers.source" = "nixpkgs";
  };
}
