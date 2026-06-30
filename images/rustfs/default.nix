{ mkImage, pkgs, lib, ... }:

mkImage {
  drv = pkgs.rustfs;
  name = "rustfs";
  tag = pkgs.rustfs.version;
  entrypoint = [ "${pkgs.rustfs}/bin/rustfs" ];
  # Was `server --help` (a one-shot, and `server` isn't even a subcommand —
  # the upstream image's CMD is just `rustfs`). Run the S3 server directly,
  # driven by RUSTFS_* env, mirroring the upstream Dockerfile: bind the S3 API
  # on :9000 and the console on :9001 (":" host = all interfaces), with the
  # default rustfsadmin credentials. Runs as root (like upstream/prod) so it
  # can write the /data volume; logs go to the writable /tmp. Operators mount a
  # PVC at /data and override the keys.
  cmd = [];

  extraPkgs = with pkgs; [ fuse3 cacert ];

  # Root, matching the upstream rustfs/rustfs image (it writes a flock + the
  # data tree under /data).
  user = "0:0";

  env = {
    RUSTFS_VOLUMES = "/data";
    RUSTFS_ADDRESS = ":9000";
    RUSTFS_CONSOLE_ADDRESS = ":9001";
    RUSTFS_CONSOLE_ENABLE = "true";
    RUSTFS_ACCESS_KEY = "rustfsadmin";
    RUSTFS_SECRET_KEY = "rustfsadmin";
    RUSTFS_OBS_LOG_DIRECTORY = "/tmp";
  };

  labels = {
    "org.opencontainers.image.title" = "RustFS";
    "org.opencontainers.image.description" = "A distributed POSIX file system built on top of object storage";
    "org.opencontainers.image.version" = pkgs.rustfs.version;
  };
}
