{ mkImage, pkgs, lib, ... }:

# strace - System call tracer
# https://strace.io/

mkImage {
  drv = pkgs.strace;
  name = "strace";
  tag = "v${pkgs.strace.version}";
  entrypoint = [ "${pkgs.strace}/bin/strace" ];
  cmd = [ "-V" ];

  labels = {
    "org.opencontainers.image.title" = "strace";
    "org.opencontainers.image.description" = "Linux system call tracer";
    "org.opencontainers.image.version" = pkgs.strace.version;
  };
}
