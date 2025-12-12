{ mkImage, pkgs, lib, ... }:

# zoxide - Smarter cd command
# https://github.com/ajeetdsouza/zoxide

mkImage {
  drv = pkgs.zoxide;
  name = "zoxide";
  tag = "v${pkgs.zoxide.version}";
  entrypoint = [ "${pkgs.zoxide}/bin/zoxide" ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "zoxide";
    "org.opencontainers.image.description" = "Fast cd command that learns your habits";
    "org.opencontainers.image.version" = pkgs.zoxide.version;
  };
}
