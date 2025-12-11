# skopeo
# =============
# Skopeo - Container image utility
# https://github.com/containers/skopeo
#
# Skopeo is a command line utility for various operations on container
# images and image repositories.

{ mkImage, pkgs, lib, ... }:

mkImage {
  drv = pkgs.skopeo;
  name = "skopeo";
  tag = "v${pkgs.skopeo.version}";
  entrypoint = [ "${pkgs.skopeo}/bin/skopeo" ];
  cmd = [ "--help" ];

  extraPkgs = with pkgs; [ cacert ];

  labels = {
    "org.opencontainers.image.title" = "Skopeo";
    "org.opencontainers.image.description" = "Container image utility for copying, inspecting, and signing images";
    "org.opencontainers.image.version" = pkgs.skopeo.version;
  };
}
