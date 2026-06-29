{ mkImage, pkgs, lib, ... }:

# nova
# Container image packaging nixpkgs.nova
mkImage {
  drv = pkgs.nova;
  name = "nova";
  tag = "v${pkgs.nova.version}";
  entrypoint = [ (lib.getExe pkgs.nova) ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "nova";
    "org.opencontainers.image.description" = "nova container image (nixpkgs.nova)";
    "org.opencontainers.image.version" = pkgs.nova.version;
    "io.nix-containers.source" = "nixpkgs";
  };
}
