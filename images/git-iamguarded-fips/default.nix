{ mkImage, pkgs, lib, ... }:

# git-iamguarded-fips
# Container image packaging nixpkgs.git
mkImage {
  drv = pkgs.git;
  name = "git-iamguarded-fips";
  tag = "v${pkgs.git.version}";
  entrypoint = [ (lib.getExe pkgs.git) ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "git-iamguarded-fips";
    "org.opencontainers.image.description" = "git-iamguarded-fips container image (nixpkgs.git)";
    "org.opencontainers.image.version" = pkgs.git.version;
    "io.nix-containers.source" = "nixpkgs";
  };
}
