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
  # `minio` with no subcommand prints usage and exits. Default to
  # `server /tmp/minio-data` so bare `docker run` and kind smoke boot
  # a working server; chart pods override the data path to their PVC.
  cmd = [ "server" "/tmp/minio-data" ];
  user = "1001:0";
  env = {
    # Password default satisfies minio's minimum length requirement so
    # standalone runs come up green. Chart pins to a real secret.
    MINIO_ROOT_USER = "minioadmin";
    MINIO_ROOT_PASSWORD = "minioadmin";
  };
  labels = {
    "org.opencontainers.image.title" = "minio-nixchart";
    "org.opencontainers.image.description" = "MinIO tuned for the nix-containers charts/minio chart";
    "org.opencontainers.image.version" = pkgs.minio.version;
    "io.nix-containers.chart" = "minio";
  };
}
