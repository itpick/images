{ mkImage, pkgs, lib, ... }:

# git-iamguarded
# Container image packaging nixpkgs.git
mkImage {
  drv = pkgs.git;
  name = "git-iamguarded";
  tag = "v${pkgs.git.version}";
  entrypoint = [ (lib.getExe pkgs.git) ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "git-iamguarded";
    "org.opencontainers.image.description" = "git-iamguarded container image (nixpkgs.git)";
    "org.opencontainers.image.version" = pkgs.git.version;
    "io.nix-containers.source" = "nixpkgs";
  };
}
