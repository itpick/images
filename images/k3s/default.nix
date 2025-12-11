{ mkImage, pkgs, lib, ... }:

# K3s - Lightweight Kubernetes
# https://k3s.io/

mkImage {
  drv = pkgs.k3s;
  name = "k3s";
  tag = "v${pkgs.k3s.version}";
  entrypoint = [ "${pkgs.k3s}/bin/k3s" ];
  cmd = [ "--help" ];

  extraPkgs = with pkgs; [
    iptables
    iproute2
    cacert
  ];

  labels = {
    "org.opencontainers.image.title" = "K3s";
    "org.opencontainers.image.description" = "Lightweight Kubernetes distribution";
    "org.opencontainers.image.version" = pkgs.k3s.version;
    "io.nix-containers.chart" = "k3s";
  };
}
