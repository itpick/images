{ mkImage, pkgs, lib, ... }:

# Miller - Data processing for CSV, JSON, etc.
# https://miller.readthedocs.io/

mkImage {
  drv = pkgs.miller;
  name = "miller";
  tag = "v${pkgs.miller.version}";
  entrypoint = [ "${pkgs.miller}/bin/mlr" ];
  cmd = [ "--version" ];

  labels = {
    "org.opencontainers.image.title" = "Miller";
    "org.opencontainers.image.description" = "Like awk, sed, cut for CSV, TSV, and JSON";
    "org.opencontainers.image.version" = pkgs.miller.version;
  };
}
