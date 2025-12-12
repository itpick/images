{ mkImage, pkgs, lib, ... }:

# Exim - Mail transfer agent
# https://www.exim.org/

mkImage {
  drv = pkgs.exim;
  name = "exim";
  tag = "v${pkgs.exim.version}";
  entrypoint = [ "${pkgs.exim}/bin/exim" ];
  cmd = [ "-bV" ];

  labels = {
    "org.opencontainers.image.title" = "Exim";
    "org.opencontainers.image.description" = "Message transfer agent for Unix systems";
    "org.opencontainers.image.version" = pkgs.exim.version;
  };
}
