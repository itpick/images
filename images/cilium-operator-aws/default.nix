{ mkImage, pkgs, lib, ... }:

# Cilium Operator AWS - Kubernetes operator for Cilium with AWS ENI IPAM
# https://github.com/cilium/cilium

mkImage {
  drv = pkgs.cilium.cilium-operator-aws;
  name = "cilium-operator-aws";
  tag = "v${pkgs.cilium.version}";
  entrypoint = [ "${pkgs.cilium.cilium-operator-aws}/bin/cilium-operator-aws" ];

  extraPkgs = with pkgs; [ cacert ];

  # HOME needed for gops to write config files
  env = {
    HOME = "/tmp";
  };

  labels = {
    "org.opencontainers.image.title" = "Cilium Operator AWS";
    "org.opencontainers.image.description" = "Kubernetes operator for Cilium with AWS ENI IPAM support";
    "org.opencontainers.image.version" = pkgs.cilium.version;
    "io.nix-containers.chart" = "cilium";
  };
}
