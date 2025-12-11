{ mkImage, pkgs, lib, ... }:

# BuildKit - Concurrent, cache-efficient, and Dockerfile-agnostic builder toolkit
# https://github.com/moby/buildkit

mkImage {
  drv = pkgs.buildkit;
  name = "buildkit";
  tag = "v${pkgs.buildkit.version}";
  entrypoint = [ "${pkgs.buildkit}/bin/buildkitd" ];
  cmd = [];

  extraPkgs = with pkgs; [ cacert iptables ];

  labels = {
    "org.opencontainers.image.title" = "BuildKit";
    "org.opencontainers.image.description" = "Concurrent, cache-efficient, and Dockerfile-agnostic builder toolkit";
    "org.opencontainers.image.version" = pkgs.buildkit.version;
  };
}
