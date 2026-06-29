{ mkImage, pkgs, lib, ... }:

# librechat-fips
# Container image packaging nixpkgs.librechat
mkImage {
  drv = pkgs.librechat;
  name = "librechat-fips";
  tag = "v${pkgs.librechat.version}";
  entrypoint = [ (lib.getExe pkgs.librechat) ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "librechat-fips";
    "org.opencontainers.image.description" = "librechat-fips container image (nixpkgs.librechat)";
    "org.opencontainers.image.version" = pkgs.librechat.version;
    "io.nix-containers.source" = "nixpkgs";
  };
}
