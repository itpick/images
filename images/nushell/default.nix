{ mkImage, pkgs, lib, ... }:

# Nushell - Modern shell
# https://www.nushell.sh/

mkImage {
  drv = pkgs.nushell;
  name = "nushell";
  tag = "v${pkgs.nushell.version}";
  entrypoint = [ "${pkgs.nushell}/bin/nu" ];
  cmd = [ "--version" ];

  labels = {
    "org.opencontainers.image.title" = "Nushell";
    "org.opencontainers.image.description" = "Modern shell with structured data";
    "org.opencontainers.image.version" = pkgs.nushell.version;
  };
}
