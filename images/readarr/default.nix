{ mkImage, pkgs, lib, ... }:

# Readarr - Book collection manager
# https://readarr.com/

mkImage {
  drv = pkgs.readarr;
  name = "readarr";
  tag = "v${pkgs.readarr.version}";
  entrypoint = [ "${pkgs.readarr}/bin/Readarr" ];
  # Was empty (no command). Readarr binds *:8787 by default (BindAddress "*"),
  # but its AppData dir defaults to $HOME/.config/Readarr — which mkImage's
  # nonroot (65534) user can't write, so it CrashLoops creating config.xml +
  # readarr.db. Point -data at the writable /tmp (Readarr creates the dir on
  # first run) and -nobrowser so it doesn't try to launch one. Operators mount a
  # PVC and override -data for a persistent library. (Same Servarr fix as radarr/sonarr.)
  cmd = [ "-nobrowser" "-data=/tmp/readarr" ];

  extraPkgs = with pkgs; [ cacert ];

  labels = {
    "org.opencontainers.image.title" = "Readarr";
    "org.opencontainers.image.description" = "Book collection manager";
    "org.opencontainers.image.version" = pkgs.readarr.version;
  };
}
