{ mkImage, pkgs, lib, ... }:

# reposilite
# Container image packaging nixpkgs.reposilite
mkImage {
  drv = pkgs.reposilite;
  name = "reposilite";
  tag = "v${pkgs.reposilite.version}";
  entrypoint = [ (lib.getExe pkgs.reposilite) ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "reposilite";
    "org.opencontainers.image.description" = "reposilite container image (nixpkgs.reposilite)";
    "org.opencontainers.image.version" = pkgs.reposilite.version;
    "io.nix-containers.source" = "nixpkgs";
  };
}
