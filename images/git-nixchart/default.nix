{ mkImage, pkgs, lib, ... }:

# git-nixchart
# Container image packaging nixpkgs.git
mkImage {
  drv = pkgs.git;
  name = "git-nixchart";
  tag = "v${pkgs.git.version}";
  entrypoint = [ (lib.getExe pkgs.git) ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "git-nixchart";
    "org.opencontainers.image.description" = "git-nixchart container image (nixpkgs.git)";
    "org.opencontainers.image.version" = pkgs.git.version;
    "io.nix-containers.source" = "nixpkgs";
  };
}
