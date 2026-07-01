{ mkImage, pkgs, lib, ... }:

# minio-nixchart
# ==============
# MinIO S3-compatible object store for charts/minio. Runs
# `minio server` — chart supplies MINIO_ROOT_USER, MINIO_ROOT_PASSWORD,
# MINIO_BROWSER, etc., which minio reads natively.

mkImage {
  drv = pkgs.minio;
  name = "minio-nixchart";
  tag = "v${pkgs.minio.version}";
  entrypoint = [ (lib.getExe pkgs.minio) ];
  cmd = [];
  user = "1001:0";
  labels = {
    "org.opencontainers.image.title" = "minio-nixchart";
    "org.opencontainers.image.description" = "MinIO tuned for the nix-containers charts/minio chart";
    "org.opencontainers.image.version" = pkgs.minio.version;
    "io.nix-containers.chart" = "minio";
  };
}
