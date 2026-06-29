{ mkImage, pkgs, lib, ... }:

# spiffe-helper-fips
# Container image packaging nixpkgs.spiffe-helper
mkImage {
  drv = pkgs.spiffe-helper;
  name = "spiffe-helper-fips";
  tag = "v${pkgs.spiffe-helper.version}";
  entrypoint = [ (lib.getExe pkgs.spiffe-helper) ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "spiffe-helper-fips";
    "org.opencontainers.image.description" = "spiffe-helper-fips container image (nixpkgs.spiffe-helper)";
    "org.opencontainers.image.version" = pkgs.spiffe-helper.version;
    "io.nix-containers.source" = "nixpkgs";
  };
}
