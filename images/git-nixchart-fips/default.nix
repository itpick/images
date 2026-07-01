{ mkImage, pkgs, lib, ... }:

# git-nixchart-fips
# Container image packaging nixpkgs.git
mkImage {
  drv = pkgs.git;
  name = "git-nixchart-fips";
  tag = "v${pkgs.git.version}";
  entrypoint = [ (lib.getExe pkgs.git) ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "git-nixchart-fips";
    "org.opencontainers.image.description" = "git-nixchart-fips container image (nixpkgs.git)";
    "org.opencontainers.image.version" = pkgs.git.version;
    "io.nix-containers.source" = "nixpkgs";
  };
}
