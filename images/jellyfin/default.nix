{ mkImage, pkgs, lib, ... }:

# Jellyfin - Media server
# https://jellyfin.org/

mkImage {
  drv = pkgs.jellyfin;
  name = "jellyfin";
  tag = "v${pkgs.jellyfin.version}";
  entrypoint = [ "${pkgs.jellyfin}/bin/jellyfin" ];
  cmd = [];

  # Jellyfin binds 0.0.0.0:8096 by default, but its data/config/cache/log dirs
  # default to platform paths under /var (or $HOME) that mkImage's nonroot
  # (65534) user can't write, so it CrashLoops on startup. Point them all at the
  # writable /tmp; jellyfin creates the (nested) dirs on first run. The web-UI
  # dir is left to the nixpkgs wrapper's bundled jellyfin-web. Operators mount a
  # PVC and override JELLYFIN_DATA_DIR for a persistent library.
  env = {
    JELLYFIN_DATA_DIR = "/tmp/jellyfin/data";
    JELLYFIN_CONFIG_DIR = "/tmp/jellyfin/config";
    JELLYFIN_CACHE_DIR = "/tmp/jellyfin/cache";
    JELLYFIN_LOG_DIR = "/tmp/jellyfin/log";
  };

  extraPkgs = with pkgs; [ cacert ffmpeg ];

  labels = {
    "org.opencontainers.image.title" = "Jellyfin";
    "org.opencontainers.image.description" = "Free software media system";
    "org.opencontainers.image.version" = pkgs.jellyfin.version;
  };
}
