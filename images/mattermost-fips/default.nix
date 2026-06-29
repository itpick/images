{ mkImage, pkgs, lib, ... }:

# mattermost-fips
# Container image packaging nixpkgs.mattermost
mkImage {
  drv = pkgs.mattermost;
  name = "mattermost-fips";
  tag = "v${pkgs.mattermost.version}";
  entrypoint = [ (lib.getExe pkgs.mattermost) ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "mattermost-fips";
    "org.opencontainers.image.description" = "mattermost-fips container image (nixpkgs.mattermost)";
    "org.opencontainers.image.version" = pkgs.mattermost.version;
    "io.nix-containers.source" = "nixpkgs";
  };
}
