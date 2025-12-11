{ mkImage, pkgs, lib, ... }:

# Calico Kube Controllers - Kubernetes controllers for Calico
# https://www.tigera.io/project-calico/

mkImage {
  drv = pkgs.calico-kube-controllers;
  name = "calico-kube-controllers";
  tag = "v${pkgs.calico-kube-controllers.version}";
  entrypoint = [ "${pkgs.calico-kube-controllers}/bin/kube-controllers" ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "Calico Kube Controllers";
    "org.opencontainers.image.description" = "Kubernetes controllers for Calico policy and IPAM";
    "org.opencontainers.image.version" = pkgs.calico-kube-controllers.version;
  };
}
