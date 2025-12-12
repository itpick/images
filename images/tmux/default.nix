{ mkImage, pkgs, lib, ... }:

# tmux - Terminal multiplexer
# https://github.com/tmux/tmux

mkImage {
  drv = pkgs.tmux;
  name = "tmux";
  tag = "v${pkgs.tmux.version}";
  entrypoint = [ "${pkgs.tmux}/bin/tmux" ];
  cmd = [ "-V" ];

  labels = {
    "org.opencontainers.image.title" = "tmux";
    "org.opencontainers.image.description" = "Terminal multiplexer";
    "org.opencontainers.image.version" = pkgs.tmux.version;
  };
}
