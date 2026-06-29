{ mkImage, pkgs, lib, ... }:

# librechat
# Container image packaging nixpkgs.librechat
mkImage {
  drv = pkgs.librechat;
  name = "librechat";
  tag = "v${pkgs.librechat.version}";
  entrypoint = [ (lib.getExe pkgs.librechat) ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "librechat";
    "org.opencontainers.image.description" = "librechat container image (nixpkgs.librechat)";
    "org.opencontainers.image.version" = pkgs.librechat.version;
    "io.nix-containers.source" = "nixpkgs";
  };
}
