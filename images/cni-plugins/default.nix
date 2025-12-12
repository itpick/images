{ mkImage, pkgs, lib, ... }:

# CNI Plugins - Container Network Interface plugins
# https://github.com/containernetworking/plugins

mkImage {
  drv = pkgs.cni-plugins;
  name = "cni-plugins";
  tag = "v${pkgs.cni-plugins.version}";
  entrypoint = [ "${pkgs.cni-plugins}/bin/bridge" ];
  cmd = [];

  labels = {
    "org.opencontainers.image.title" = "CNI Plugins";
    "org.opencontainers.image.description" = "Container Network Interface plugins for Kubernetes";
    "org.opencontainers.image.version" = pkgs.cni-plugins.version;
  };
}
