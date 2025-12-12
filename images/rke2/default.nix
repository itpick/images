{ mkImage, pkgs, lib, ... }:

# RKE2 - Rancher Kubernetes Engine 2
# https://docs.rke2.io/

mkImage {
  drv = pkgs.rke2;
  name = "rke2";
  tag = "v${pkgs.rke2.version}";
  entrypoint = [ "${pkgs.rke2}/bin/rke2" ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "RKE2";
    "org.opencontainers.image.description" = "Rancher's next-generation Kubernetes distribution";
    "org.opencontainers.image.version" = pkgs.rke2.version;
  };
}
