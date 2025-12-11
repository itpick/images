{ mkImage, pkgs, lib, ... }:

# Nextflow - Data-driven computational pipelines
# https://www.nextflow.io/

mkImage {
  drv = pkgs.nextflow;
  name = "nextflow";
  tag = "v${pkgs.nextflow.version}";
  entrypoint = [ "${pkgs.nextflow}/bin/nextflow" ];
  cmd = [ "--help" ];

  extraPkgs = with pkgs; [ cacert ];

  labels = {
    "org.opencontainers.image.title" = "Nextflow";
    "org.opencontainers.image.description" = "Data-driven computational pipelines";
    "org.opencontainers.image.version" = pkgs.nextflow.version;
  };
}
