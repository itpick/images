{ mkImage, pkgs, lib, ... }:

# heartbeat-fips
# Container image packaging nixpkgs.heartbeat
mkImage {
  drv = pkgs.heartbeat;
  name = "heartbeat-fips";
  tag = "v${pkgs.heartbeat.version}";
  entrypoint = [ (lib.getExe pkgs.heartbeat) ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "heartbeat-fips";
    "org.opencontainers.image.description" = "heartbeat-fips container image (nixpkgs.heartbeat)";
    "org.opencontainers.image.version" = pkgs.heartbeat.version;
    "io.nix-containers.source" = "nixpkgs";
  };
}
