{ mkImage, pkgs, lib, ... }:

# Flannel - Network fabric for containers
# https://github.com/flannel-io/flannel

mkImage {
  drv = pkgs.flannel;
  name = "flannel";
  tag = "v${pkgs.flannel.version}";
  entrypoint = [ "${pkgs.flannel}/bin/flannel" ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "Flannel";
    "org.opencontainers.image.description" = "Network fabric for containers designed for Kubernetes";
    "org.opencontainers.image.version" = pkgs.flannel.version;
  };
}
