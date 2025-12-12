{ mkImage, pkgs, lib, ... }:

# Podman - Container management tool
# https://podman.io/

mkImage {
  drv = pkgs.podman;
  name = "podman";
  tag = "v${pkgs.podman.version}";
  entrypoint = [ "${pkgs.podman}/bin/podman" ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "Podman";
    "org.opencontainers.image.description" = "Program for managing pods, containers and container images";
    "org.opencontainers.image.version" = pkgs.podman.version;
  };
}
