{ mkImage, pkgs, lib, ... }:

# delta - Syntax-highlighting pager for git
# https://github.com/dandavison/delta

mkImage {
  drv = pkgs.delta;
  name = "delta";
  tag = "v${pkgs.delta.version}";
  entrypoint = [ "${pkgs.delta}/bin/delta" ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "delta";
    "org.opencontainers.image.description" = "Syntax-highlighting pager for git";
    "org.opencontainers.image.version" = pkgs.delta.version;
  };
}
