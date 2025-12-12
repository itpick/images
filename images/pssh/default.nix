{ mkImage, pkgs, lib, ... }:

# pssh - Parallel SSH
# https://github.com/lilydjwg/pssh

mkImage {
  drv = pkgs.pssh;
  name = "pssh";
  tag = "v${pkgs.pssh.version}";
  entrypoint = [ "${pkgs.pssh}/bin/pssh" ];
  cmd = [ "--version" ];

  labels = {
    "org.opencontainers.image.title" = "pssh";
    "org.opencontainers.image.description" = "Parallel SSH execution and file copying";
    "org.opencontainers.image.version" = pkgs.pssh.version;
  };
}
