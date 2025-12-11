{ mkImage, pkgs, lib, ... }:

# Kepler - Kubernetes Energy Consumption exporter
# https://sustainable-computing.io/

mkImage {
  drv = pkgs.kepler;
  name = "kepler";
  tag = "v${pkgs.kepler.version}";
  entrypoint = [ "${pkgs.kepler}/bin/kepler" ];
  cmd = [];

  labels = {
    "org.opencontainers.image.title" = "Kepler";
    "org.opencontainers.image.description" = "Kubernetes-based Efficient Power Level Exporter";
    "org.opencontainers.image.version" = pkgs.kepler.version;
  };
}
