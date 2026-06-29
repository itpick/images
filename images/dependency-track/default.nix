{ mkImage, pkgs, lib, ... }:

# dependency-track
# Container image packaging nixpkgs.dependency-track
mkImage {
  drv = pkgs.dependency-track;
  name = "dependency-track";
  tag = "v${pkgs.dependency-track.version}";
  entrypoint = [ (lib.getExe pkgs.dependency-track) ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "dependency-track";
    "org.opencontainers.image.description" = "dependency-track container image (nixpkgs.dependency-track)";
    "org.opencontainers.image.version" = pkgs.dependency-track.version;
    "io.nix-containers.source" = "nixpkgs";
  };
}
