{ mkImage, pkgs, lib, ... }:

# spark-nixchart
# Container image packaging nixpkgs.spark
mkImage {
  drv = pkgs.spark;
  name = "spark-nixchart";
  tag = "v${pkgs.spark.version}";
  entrypoint = [ (lib.getExe pkgs.spark) ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "spark-nixchart";
    "org.opencontainers.image.description" = "spark-nixchart container image (nixpkgs.spark)";
    "org.opencontainers.image.version" = pkgs.spark.version;
    "io.nix-containers.source" = "nixpkgs";
  };
}
