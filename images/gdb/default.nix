{ mkImage, pkgs, lib, ... }:

# GDB - GNU Debugger
# https://www.gnu.org/software/gdb/

mkImage {
  drv = pkgs.gdb;
  name = "gdb";
  tag = "v${pkgs.gdb.version}";
  entrypoint = [ "${pkgs.gdb}/bin/gdb" ];
  cmd = [ "--version" ];

  labels = {
    "org.opencontainers.image.title" = "GDB";
    "org.opencontainers.image.description" = "GNU Project debugger";
    "org.opencontainers.image.version" = pkgs.gdb.version;
  };
}
