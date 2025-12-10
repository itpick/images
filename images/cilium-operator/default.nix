{ mkImage, pkgs, lib, ... }:

# Cilium Operator - Kubernetes operator for Cilium
# https://github.com/cilium/cilium

mkImage {
  drv = pkgs.cilium.cilium-operator;
  name = "cilium-operator-generic";
  tag = "v${pkgs.cilium.version}";
  entrypoint = [ "${pkgs.cilium.cilium-operator}/bin/cilium-operator-generic" ];

  extraPkgs = with pkgs; [ cacert ];

  # HOME needed for gops to write config files
  env = {
    HOME = "/tmp";
  };

  labels = {
    "org.opencontainers.image.title" = "Cilium Operator";
    "org.opencontainers.image.description" = "Kubernetes operator for Cilium eBPF networking";
    "org.opencontainers.image.version" = pkgs.cilium.version;
    "io.nix-containers.chart" = "cilium";
  };
}
