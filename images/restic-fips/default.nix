{ mkImage, pkgs, lib, ... }:

# restic-fips
# Container image packaging nixpkgs.restic
mkImage {
  drv = pkgs.restic;
  name = "restic-fips";
  tag = "v${pkgs.restic.version}";
  entrypoint = [ (lib.getExe pkgs.restic) ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "restic-fips";
    "org.opencontainers.image.description" = "restic-fips container image (nixpkgs.restic)";
    "org.opencontainers.image.version" = pkgs.restic.version;
    "io.nix-containers.source" = "nixpkgs";
  };
}
