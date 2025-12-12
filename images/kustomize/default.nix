{ mkImage, pkgs, lib, ... }:

# Kustomize - Kubernetes YAML customization
# https://kustomize.io/

mkImage {
  drv = pkgs.kustomize;
  name = "kustomize";
  tag = "v${pkgs.kustomize.version}";
  entrypoint = [ "${pkgs.kustomize}/bin/kustomize" ];
  cmd = [ "version" ];

  labels = {
    "org.opencontainers.image.title" = "Kustomize";
    "org.opencontainers.image.description" = "Kubernetes YAML customization";
    "org.opencontainers.image.version" = pkgs.kustomize.version;
  };
}
