{ mkImage, pkgs, lib, ... }:

# slirp4netns - User-mode networking for rootless containers
# https://github.com/rootless-containers/slirp4netns

mkImage {
  drv = pkgs.slirp4netns;
  name = "slirp4netns";
  tag = "v${pkgs.slirp4netns.version}";
  entrypoint = [ "${pkgs.slirp4netns}/bin/slirp4netns" ];
  cmd = [ "--version" ];

  labels = {
    "org.opencontainers.image.title" = "slirp4netns";
    "org.opencontainers.image.description" = "User-mode networking for rootless containers";
    "org.opencontainers.image.version" = pkgs.slirp4netns.version;
  };
}
