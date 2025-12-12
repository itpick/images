{ mkImage, pkgs, lib, ... }:

# Temporal - Workflow orchestration platform
# https://temporal.io/

mkImage {
  drv = pkgs.temporal;
  name = "temporal";
  tag = "v${pkgs.temporal.version}";
  entrypoint = [ "${pkgs.temporal}/bin/temporal" ];
  cmd = [ "--help" ];

  extraPkgs = with pkgs; [ cacert ];

  labels = {
    "org.opencontainers.image.title" = "Temporal";
    "org.opencontainers.image.description" = "Workflow orchestration platform";
    "org.opencontainers.image.version" = pkgs.temporal.version;
  };
}
