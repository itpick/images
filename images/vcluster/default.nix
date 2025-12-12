{ mkImage, pkgs, lib, ... }:

# vcluster - Virtual Kubernetes clusters
# https://www.vcluster.com/

mkImage {
  drv = pkgs.vcluster;
  name = "vcluster";
  tag = "v${pkgs.vcluster.version}";
  entrypoint = [ "${pkgs.vcluster}/bin/vcluster" ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "vcluster";
    "org.opencontainers.image.description" = "Create fully functional virtual Kubernetes clusters";
    "org.opencontainers.image.version" = pkgs.vcluster.version;
  };
}
