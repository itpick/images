{ mkImage, pkgs, lib, ... }:

# Calico Typha - Fan-out proxy for Calico
# https://www.tigera.io/project-calico/

mkImage {
  drv = pkgs.calico-typha;
  name = "calico-typha";
  tag = "v${pkgs.calico-typha.version}";
  entrypoint = [ "${pkgs.calico-typha}/bin/calico-typha" ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "Calico Typha";
    "org.opencontainers.image.description" = "Fan-out proxy for Calico Felix to reduce load on datastore";
    "org.opencontainers.image.version" = pkgs.calico-typha.version;
  };
}
