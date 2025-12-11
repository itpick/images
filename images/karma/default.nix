{ mkImage, pkgs, lib, ... }:

# Karma - Alert dashboard for Prometheus Alertmanager
# https://github.com/prymitive/karma

mkImage {
  drv = pkgs.karma;
  name = "karma";
  tag = "v${pkgs.karma.version}";
  entrypoint = [ "${pkgs.karma}/bin/karma" ];
  cmd = [ "--help" ];

  extraPkgs = with pkgs; [ cacert ];

  labels = {
    "org.opencontainers.image.title" = "Karma";
    "org.opencontainers.image.description" = "Alert dashboard for Prometheus Alertmanager";
    "org.opencontainers.image.version" = pkgs.karma.version;
  };
}
