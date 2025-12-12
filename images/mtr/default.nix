{ mkImage, pkgs, lib, ... }:

# mtr - Network diagnostics tool
# https://www.bitwizard.nl/mtr/

mkImage {
  drv = pkgs.mtr;
  name = "mtr";
  tag = "v${pkgs.mtr.version}";
  entrypoint = [ "${pkgs.mtr}/bin/mtr" ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "mtr";
    "org.opencontainers.image.description" = "Network diagnostics tool combining ping and traceroute";
    "org.opencontainers.image.version" = pkgs.mtr.version;
  };
}
