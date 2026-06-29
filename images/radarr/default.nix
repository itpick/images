{ mkImage, pkgs, lib, ... }:

# Radarr - Movie collection manager
# https://radarr.video/

mkImage {
  drv = pkgs.radarr;
  name = "radarr";
  tag = "v${pkgs.radarr.version}";
  entrypoint = [ "${pkgs.radarr}/bin/Radarr" ];
  # Was empty (no command). Radarr binds *:7878 by default (BindAddress "*"),
  # but its AppData dir defaults to $HOME/.config/Radarr — which mkImage's
  # nonroot (65534) user can't write, so it CrashLoops creating config.xml +
  # radarr.db. Point -data at the writable /tmp (Radarr creates the dir on first
  # run) and -nobrowser so it doesn't try to launch one. Operators mount a PVC
  # and override -data for a persistent library.
  cmd = [ "-nobrowser" "-data=/tmp/radarr" ];

  extraPkgs = with pkgs; [ cacert ];

  labels = {
    "org.opencontainers.image.title" = "Radarr";
    "org.opencontainers.image.description" = "Movie collection manager";
    "org.opencontainers.image.version" = pkgs.radarr.version;
  };
}
