{ mkImage, pkgs, lib, ... }:

# jq - Command-line JSON processor
# https://stedolan.github.io/jq/

mkImage {
  drv = pkgs.jq;
  name = "jq";
  tag = "v${pkgs.jq.version}";
  entrypoint = [ "${pkgs.jq}/bin/jq" ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "jq";
    "org.opencontainers.image.description" = "Lightweight and flexible command-line JSON processor";
    "org.opencontainers.image.version" = pkgs.jq.version;
  };
}
