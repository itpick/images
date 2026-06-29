{ mkImage, pkgs, lib, ... }:

# lsb-release-minimal
# Container image packaging nixpkgs.lsb-release
mkImage {
  drv = pkgs.lsb-release;
  name = "lsb-release-minimal";
  tag = "v${pkgs.lsb-release.version}";
  entrypoint = [ (lib.getExe pkgs.lsb-release) ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "lsb-release-minimal";
    "org.opencontainers.image.description" = "lsb-release-minimal container image (nixpkgs.lsb-release)";
    "org.opencontainers.image.version" = pkgs.lsb-release.version;
    "io.nix-containers.source" = "nixpkgs";
  };
}
