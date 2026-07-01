{ mkImage, pkgs, lib, ... }:

# minio-object-browser-nixchart
# =============================
# The MinIO web console. Modern MinIO embeds the browser directly in
# the server binary (behind --console-address), so this image ships the
# same minio binary as minio-nixchart. The chart deploys it as a
# console-only pod: usually a MinIO server started against no real
# backend, purely to serve the UI, or (more commonly) points end-users
# at the primary minio server's console port.
#
# Also includes `mc` so config sync + user provisioning can run from
# the same pod without a separate init container.

mkImage {
  drv = pkgs.buildEnv {
    name = "minio-object-browser-nixchart-env";
    paths = [
      pkgs.minio
      pkgs.minio-client
      pkgs.bash
      pkgs.coreutils
      pkgs.cacert
    ];
  };
  name = "minio-object-browser-nixchart";
  tag = "v${pkgs.minio.version}";
  entrypoint = [ (lib.getExe pkgs.minio) ];
  cmd = [];
  user = "1001:0";
  labels = {
    "org.opencontainers.image.title" = "minio-object-browser-nixchart";
    "org.opencontainers.image.description" = "MinIO console (browser) image for charts/minio";
    "org.opencontainers.image.version" = pkgs.minio.version;
    "io.nix-containers.chart" = "minio";
  };
}
