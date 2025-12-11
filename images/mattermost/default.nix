# mattermost
# =============
# Mattermost - Open source platform for secure collaboration
# https://mattermost.com/

{ mkImage, pkgs, lib, ... }:

# Chainguard SBOM packages for mattermost:
# Packages available in nixpkgs:
#   pkgs.mattermost  # mattermost-11.1 (11.1.1-r1)
#   pkgs.bash  # bash (5.3-r3)
#   pkgs.tzdata  # tzdata (2025b-r2)

mkImage {
  drv = pkgs.mattermost;
  name = "mattermost";
  tag = pkgs.mattermost.version;
  entrypoint = [ "${pkgs.mattermost}/bin/mattermost" ];
  cmd = [ "server" ];

  extraPkgs = with pkgs; [ bash tzdata cacert ];

  env = {
    MM_DATA_DIR = "/mattermost/data";
    MM_CONFIG = "/mattermost/config/config.json";
  };

  labels = {
    "org.opencontainers.image.title" = "Mattermost";
    "org.opencontainers.image.description" = "Open source platform for secure collaboration";
    "org.opencontainers.image.version" = pkgs.mattermost.version;
    "io.nix-containers.chart" = "mattermost";
  };
}
