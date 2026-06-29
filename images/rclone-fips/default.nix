{ mkImage, pkgs, lib, ... }:

# rclone-fips
# Container image packaging nixpkgs.rclone
mkImage {
  drv = pkgs.rclone;
  name = "rclone-fips";
  tag = "v${pkgs.rclone.version}";
  entrypoint = [ (lib.getExe pkgs.rclone) ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "rclone-fips";
    "org.opencontainers.image.description" = "rclone-fips container image (nixpkgs.rclone)";
    "org.opencontainers.image.version" = pkgs.rclone.version;
    "io.nix-containers.source" = "nixpkgs";
  };
}
