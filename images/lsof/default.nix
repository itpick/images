{ mkImage, pkgs, lib, ... }:

# lsof - List open files
# https://github.com/lsof-org/lsof

mkImage {
  drv = pkgs.lsof;
  name = "lsof";
  tag = "v${pkgs.lsof.version}";
  entrypoint = [ "${pkgs.lsof}/bin/lsof" ];
  cmd = [ "-v" ];

  labels = {
    "org.opencontainers.image.title" = "lsof";
    "org.opencontainers.image.description" = "List open files utility";
    "org.opencontainers.image.version" = pkgs.lsof.version;
  };
}
