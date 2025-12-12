{ mkImage, pkgs, lib, ... }:

# fzf - Command-line fuzzy finder
# https://github.com/junegunn/fzf

mkImage {
  drv = pkgs.fzf;
  name = "fzf";
  tag = "v${pkgs.fzf.version}";
  entrypoint = [ "${pkgs.fzf}/bin/fzf" ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "fzf";
    "org.opencontainers.image.description" = "Command-line fuzzy finder";
    "org.opencontainers.image.version" = pkgs.fzf.version;
  };
}
