{ mkImage, pkgs, lib, ... }:

# kind - Kubernetes in Docker
# https://kind.sigs.k8s.io/

mkImage {
  drv = pkgs.kind;
  name = "kind";
  tag = "v${pkgs.kind.version}";
  entrypoint = [ "${pkgs.kind}/bin/kind" ];
  cmd = [ "version" ];

  labels = {
    "org.opencontainers.image.title" = "kind";
    "org.opencontainers.image.description" = "Kubernetes in Docker - local clusters for testing";
    "org.opencontainers.image.version" = pkgs.kind.version;
  };
}
