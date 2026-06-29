{ mkImage, pkgs, lib, ... }:

# ffmpeg-fips
# Container image packaging nixpkgs.ffmpeg
mkImage {
  drv = pkgs.ffmpeg;
  name = "ffmpeg-fips";
  tag = "v${pkgs.ffmpeg.version}";
  entrypoint = [ (lib.getExe pkgs.ffmpeg) ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "ffmpeg-fips";
    "org.opencontainers.image.description" = "ffmpeg-fips container image (nixpkgs.ffmpeg)";
    "org.opencontainers.image.version" = pkgs.ffmpeg.version;
    "io.nix-containers.source" = "nixpkgs";
  };
}
