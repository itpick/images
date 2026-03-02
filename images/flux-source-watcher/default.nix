{ mkImage, pkgs, lib, ... }:

mkImage {
  drv = pkgs.flux-source-watcher;
  name = "flux-source-watcher";
  tag = pkgs.flux-source-watcher.version;
  entrypoint = [ "${pkgs.flux-source-watcher}/bin/source-watcher" ];

  labels = {
    "org.opencontainers.image.title" = "Flux Source Watcher";
    "org.opencontainers.image.description" = "Flux source watcher - example controller for watching GitRepository and Bucket sources";
    "org.opencontainers.image.version" = pkgs.flux-source-watcher.version;
  };
}
