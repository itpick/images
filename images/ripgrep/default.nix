{ mkImage, pkgs, lib, ... }:

# ripgrep - Fast search tool
# https://github.com/BurntSushi/ripgrep

mkImage {
  drv = pkgs.ripgrep;
  name = "ripgrep";
  tag = "v${pkgs.ripgrep.version}";
  entrypoint = [ "${pkgs.ripgrep}/bin/rg" ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "ripgrep";
    "org.opencontainers.image.description" = "Fast search tool combining grep speed with usability";
    "org.opencontainers.image.version" = pkgs.ripgrep.version;
  };
}
