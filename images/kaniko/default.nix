# kaniko
# =============
# Kaniko - Build container images in Kubernetes
# https://github.com/GoogleContainerTools/kaniko
#
# Kaniko is a tool to build container images from a Dockerfile,
# inside a container or Kubernetes cluster.

{ mkImage, pkgs, lib, ... }:

mkImage {
  drv = pkgs.kaniko;
  name = "kaniko";
  tag = "v${pkgs.kaniko.version}";
  entrypoint = [ "${pkgs.kaniko}/bin/executor" ];
  cmd = [];

  extraPkgs = with pkgs; [ cacert ];

  labels = {
    "org.opencontainers.image.title" = "Kaniko";
    "org.opencontainers.image.description" = "Build container images in Kubernetes without Docker daemon";
    "org.opencontainers.image.version" = pkgs.kaniko.version;
  };
}
