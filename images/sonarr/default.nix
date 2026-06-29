{ mkImage, pkgs, lib, ... }:

# Sonarr - TV series collection manager
# https://sonarr.tv/

mkImage {
  drv = pkgs.sonarr;
  name = "sonarr";
  tag = "v${pkgs.sonarr.version}";
  entrypoint = [ "${pkgs.sonarr}/bin/Sonarr" ];
  # Was empty (no command). Sonarr binds *:8989 by default (BindAddress "*"),
  # but its AppData dir defaults to $HOME/.config/Sonarr — which mkImage's
  # nonroot (65534) user can't write, so it CrashLoops creating config.xml +
  # sonarr.db. Point -data at the writable /tmp (Sonarr creates the dir on first
  # run) and -nobrowser so it doesn't try to launch one. Operators mount a PVC
  # and override -data for a persistent library. (Same Servarr fix as radarr.)
  cmd = [ "-nobrowser" "-data=/tmp/sonarr" ];

  extraPkgs = with pkgs; [ cacert ];

  labels = {
    "org.opencontainers.image.title" = "Sonarr";
    "org.opencontainers.image.description" = "TV series collection manager";
    "org.opencontainers.image.version" = pkgs.sonarr.version;
  };
}
