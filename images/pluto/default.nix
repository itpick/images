{ mkImage, pkgs, lib, ... }:

# Pluto - Find deprecated Kubernetes apiVersions
# https://github.com/FairwindsOps/pluto

mkImage {
  drv = pkgs.pluto;
  name = "pluto";
  tag = "v${pkgs.pluto.version}";
  entrypoint = [ "${pkgs.pluto}/bin/pluto" ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "Pluto";
    "org.opencontainers.image.description" = "Find deprecated Kubernetes apiVersions";
    "org.opencontainers.image.version" = pkgs.pluto.version;
    "io.nix-containers.chart" = "pluto";
  };
}
