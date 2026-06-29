{ mkImage, pkgs, lib, ... }:

# cypress-base
# Container image packaging nixpkgs.cypress
mkImage {
  drv = pkgs.cypress;
  name = "cypress-base";
  tag = "v${pkgs.cypress.version}";
  entrypoint = [ (lib.getExe pkgs.cypress) ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "cypress-base";
    "org.opencontainers.image.description" = "cypress-base container image (nixpkgs.cypress)";
    "org.opencontainers.image.version" = pkgs.cypress.version;
    "io.nix-containers.source" = "nixpkgs";
  };
}
