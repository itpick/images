{ mkImage, pkgs, lib, ... }:

# sd - Intuitive find & replace
# https://github.com/chmln/sd

mkImage {
  drv = pkgs.sd;
  name = "sd";
  tag = "v${pkgs.sd.version}";
  entrypoint = [ "${pkgs.sd}/bin/sd" ];
  cmd = [ "--version" ];

  labels = {
    "org.opencontainers.image.title" = "sd";
    "org.opencontainers.image.description" = "Intuitive find & replace CLI";
    "org.opencontainers.image.version" = pkgs.sd.version;
  };
}
