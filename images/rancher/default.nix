{ mkImage, pkgs, lib, ... }:

# Rancher CLI - Command line tool for Rancher
# https://rancher.com/

mkImage {
  drv = pkgs.rancher;
  name = "rancher";
  tag = "v${pkgs.rancher.version}";
  entrypoint = [ "${pkgs.rancher}/bin/rancher" ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "Rancher CLI";
    "org.opencontainers.image.description" = "Command line tool for Rancher";
    "org.opencontainers.image.version" = pkgs.rancher.version;
  };
}
