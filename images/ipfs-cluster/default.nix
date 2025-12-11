{ mkImage, pkgs, lib, ... }:

# IPFS Cluster - Pinset orchestration for IPFS
# https://ipfscluster.io/

mkImage {
  drv = pkgs.ipfs-cluster;
  name = "ipfs-cluster";
  tag = "v${pkgs.ipfs-cluster.version}";
  entrypoint = [ "${pkgs.ipfs-cluster}/bin/ipfs-cluster-service" ];
  cmd = [ "--help" ];

  extraPkgs = with pkgs; [ cacert ];

  labels = {
    "org.opencontainers.image.title" = "IPFS Cluster";
    "org.opencontainers.image.description" = "Pinset orchestration for IPFS";
    "org.opencontainers.image.version" = pkgs.ipfs-cluster.version;
  };
}
