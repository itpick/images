{ mkImage, pkgs, lib, ... }:

mkImage {
  drv = pkgs.rustfs;
  name = "rustfs";
  tag = pkgs.rustfs.version;
  entrypoint = [ "${pkgs.rustfs}/bin/rustfs" ];
  cmd = [ "server" "--help" ];

  extraPkgs = with pkgs; [ fuse3 cacert ];

  env = {
    RUSTFS_VOLUMES = "/data";
  };

  labels = {
    "org.opencontainers.image.title" = "RustFS";
    "org.opencontainers.image.description" = "A distributed POSIX file system built on top of object storage";
    "org.opencontainers.image.version" = pkgs.rustfs.version;
  };
}
