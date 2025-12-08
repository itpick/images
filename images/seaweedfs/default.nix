{ buildCLIImage, pkgs, lib, ... }:

# SeaweedFS - Simple and highly scalable distributed file system
buildCLIImage {
  drv = pkgs.seaweedfs;
  name = "seaweedfs";
  tag = pkgs.seaweedfs.version;
  entrypoint = [ "${pkgs.seaweedfs}/bin/weed" ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "SeaweedFS";
    "org.opencontainers.image.description" = "Simple and highly scalable distributed file system";
    "org.opencontainers.image.version" = pkgs.seaweedfs.version;
    "io.nix-containers.chart" = "seaweedfs";
  };
}
