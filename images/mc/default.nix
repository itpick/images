{ mkImage, pkgs, lib, ... }:

# mc - MinIO Client
# Command-line tool for interacting with MinIO and S3-compatible object storage

mkImage {
  drv = pkgs.minio-client;
  name = "mc";
  tag = "latest";
  entrypoint = [ "${pkgs.minio-client}/bin/mc" ];
  cmd = [ "--help" ];

  extraPkgs = with pkgs; [
    bash
    coreutils
    cacert
  ];

  labels = {
    "org.opencontainers.image.title" = "MinIO Client";
    "org.opencontainers.image.description" = "MinIO Client for object storage operations";
    "org.opencontainers.image.version" = pkgs.minio-client.version;
    "io.nix-containers.chart" = "minio";
  };
}
