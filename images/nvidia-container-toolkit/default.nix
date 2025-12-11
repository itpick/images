{ mkImage, pkgs, lib, ... }:

# NVIDIA Container Toolkit
# https://github.com/NVIDIA/nvidia-container-toolkit

mkImage {
  drv = pkgs.nvidia-container-toolkit;
  name = "nvidia-container-toolkit";
  tag = "v${pkgs.nvidia-container-toolkit.version}";
  entrypoint = [ "${pkgs.nvidia-container-toolkit}/bin/nvidia-ctk" ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "NVIDIA Container Toolkit";
    "org.opencontainers.image.description" = "Tools for building and running GPU containers";
    "org.opencontainers.image.version" = pkgs.nvidia-container-toolkit.version;
  };
}
