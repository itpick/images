{ mkImage, pkgs, lib, ... }:

# MinIO Warp - S3 benchmarking tool
# https://github.com/minio/warp

mkImage {
  drv = pkgs.minio-warp;
  name = "minio-warp";
  tag = "v${pkgs.minio-warp.version}";
  entrypoint = [ "${pkgs.minio-warp}/bin/warp" ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "MinIO Warp";
    "org.opencontainers.image.description" = "S3 benchmarking tool";
    "org.opencontainers.image.version" = pkgs.minio-warp.version;
  };
}
