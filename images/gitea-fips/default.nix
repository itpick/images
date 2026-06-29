{ mkImage, pkgs, lib, ... }:

# gitea-fips
# Container image packaging nixpkgs.gitea
mkImage {
  drv = pkgs.gitea;
  name = "gitea-fips";
  tag = "v${pkgs.gitea.version}";
  entrypoint = [ (lib.getExe pkgs.gitea) ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "gitea-fips";
    "org.opencontainers.image.description" = "gitea-fips container image (nixpkgs.gitea)";
    "org.opencontainers.image.version" = pkgs.gitea.version;
    "io.nix-containers.source" = "nixpkgs";
  };
}
