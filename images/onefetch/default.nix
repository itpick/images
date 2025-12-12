{ mkImage, pkgs, lib, ... }:

# onefetch - Git repository summary
# https://github.com/o2sh/onefetch

mkImage {
  drv = pkgs.onefetch;
  name = "onefetch";
  tag = "v${pkgs.onefetch.version}";
  entrypoint = [ "${pkgs.onefetch}/bin/onefetch" ];
  cmd = [ "--version" ];

  labels = {
    "org.opencontainers.image.title" = "onefetch";
    "org.opencontainers.image.description" = "Git repository summary in terminal";
    "org.opencontainers.image.version" = pkgs.onefetch.version;
  };
}
