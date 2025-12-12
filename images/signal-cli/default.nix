{ mkImage, pkgs, lib, ... }:

# signal-cli - Signal messenger CLI
# https://github.com/AsamK/signal-cli

mkImage {
  drv = pkgs.signal-cli;
  name = "signal-cli";
  tag = "v${pkgs.signal-cli.version}";
  entrypoint = [ "${pkgs.signal-cli}/bin/signal-cli" ];
  cmd = [ "--help" ];

  extraPkgs = with pkgs; [ cacert ];

  labels = {
    "org.opencontainers.image.title" = "signal-cli";
    "org.opencontainers.image.description" = "Signal messenger CLI";
    "org.opencontainers.image.version" = pkgs.signal-cli.version;
  };
}
