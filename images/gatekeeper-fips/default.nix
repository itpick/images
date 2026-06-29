{ mkImage, pkgs, lib, ... }:

# gatekeeper-fips
# Container image packaging nixpkgs.gatekeeper
mkImage {
  drv = pkgs.gatekeeper;
  name = "gatekeeper-fips";
  tag = "v${pkgs.gatekeeper.version}";
  entrypoint = [ (lib.getExe pkgs.gatekeeper) ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "gatekeeper-fips";
    "org.opencontainers.image.description" = "gatekeeper-fips container image (nixpkgs.gatekeeper)";
    "org.opencontainers.image.version" = pkgs.gatekeeper.version;
    "io.nix-containers.source" = "nixpkgs";
  };
}
