{ mkImage, pkgs, lib, ... }:

# procs - Modern ps replacement
# https://github.com/dalance/procs

mkImage {
  drv = pkgs.procs;
  name = "procs";
  tag = "v${pkgs.procs.version}";
  entrypoint = [ "${pkgs.procs}/bin/procs" ];
  cmd = [ "--version" ];

  labels = {
    "org.opencontainers.image.title" = "procs";
    "org.opencontainers.image.description" = "Modern replacement for ps written in Rust";
    "org.opencontainers.image.version" = pkgs.procs.version;
  };
}
