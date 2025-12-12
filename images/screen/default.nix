{ mkImage, pkgs, lib, ... }:

# GNU Screen - Terminal multiplexer
# https://www.gnu.org/software/screen/

mkImage {
  drv = pkgs.screen;
  name = "screen";
  tag = "v${pkgs.screen.version}";
  entrypoint = [ "${pkgs.screen}/bin/screen" ];
  cmd = [ "--version" ];

  labels = {
    "org.opencontainers.image.title" = "GNU Screen";
    "org.opencontainers.image.description" = "Terminal multiplexer";
    "org.opencontainers.image.version" = pkgs.screen.version;
  };
}
