{ mkImage, pkgs, lib, ... }:

# Calico API Server - Kubernetes API server for Calico
# https://www.tigera.io/project-calico/

mkImage {
  drv = pkgs.calico-apiserver;
  name = "calico-apiserver";
  tag = "v${pkgs.calico-apiserver.version}";
  entrypoint = [ "${pkgs.calico-apiserver}/bin/apiserver" ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "Calico API Server";
    "org.opencontainers.image.description" = "Kubernetes API server extension for Calico resources";
    "org.opencontainers.image.version" = pkgs.calico-apiserver.version;
  };
}
