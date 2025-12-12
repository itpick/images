{ mkImage, pkgs, lib, ... }:

# Calico CNI Plugin - Container Network Interface plugin for Calico
# https://github.com/projectcalico/calico

mkImage {
  drv = pkgs.calico-cni-plugin;
  name = "calico-cni";
  tag = "v${pkgs.calico-cni-plugin.version}";
  entrypoint = [ "${pkgs.calico-cni-plugin}/bin/calico" ];
  cmd = [];

  extraPkgs = with pkgs; [
    busybox
    cni-plugins  # Standard CNI plugins (bandwidth, host-local, loopback, portmap, tuning)
  ];

  # CNI plugins run as root
  user = "0:0";

  labels = {
    "org.opencontainers.image.title" = "Calico CNI";
    "org.opencontainers.image.description" = "Calico CNI plugin for Kubernetes networking";
    "org.opencontainers.image.version" = pkgs.calico-cni-plugin.version;
    "io.nix-containers.chart" = "tigera-operator";
  };
}
