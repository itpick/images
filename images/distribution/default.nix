{ mkImage, pkgs, lib, ... }:

# Distribution - Docker registry implementation
# https://github.com/distribution/distribution

mkImage {
  drv = pkgs.distribution;
  name = "distribution";
  tag = "v${pkgs.distribution.version}";
  entrypoint = [ "${pkgs.distribution}/bin/registry" ];
  cmd = [ "serve" "/etc/docker/registry/config.yml" ];

  extraPkgs = with pkgs; [ cacert ];

  labels = {
    "org.opencontainers.image.title" = "Distribution";
    "org.opencontainers.image.description" = "Docker registry implementation";
    "org.opencontainers.image.version" = pkgs.distribution.version;
  };
}
