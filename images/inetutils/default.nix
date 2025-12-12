{ mkImage, pkgs, lib, ... }:

# inetutils - GNU network utilities
# https://www.gnu.org/software/inetutils/

mkImage {
  drv = pkgs.inetutils;
  name = "inetutils";
  tag = "v${pkgs.inetutils.version}";
  entrypoint = [ "${pkgs.inetutils}/bin/ping" ];
  cmd = [ "--version" ];

  labels = {
    "org.opencontainers.image.title" = "inetutils";
    "org.opencontainers.image.description" = "GNU network utilities (ping, ftp, telnet, etc.)";
    "org.opencontainers.image.version" = pkgs.inetutils.version;
  };
}
