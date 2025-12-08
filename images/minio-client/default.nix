{ buildCLIImage, pkgs, lib, ... }:

buildCLIImage {
  drv = pkgs.minio-client;
  name = "mc";
  tag = "latest";
  entrypoint = [ "${pkgs.minio-client}/bin/mc" ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "MinIO Client";
    "org.opencontainers.image.description" = "MinIO Client for object storage operations";
    "org.opencontainers.image.version" = pkgs.minio-client.version;
    "io.nix-containers.chart" = "loki";
  };
}
