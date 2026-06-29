{ mkImage, pkgs, lib, ... }:

# vector-fips
# Container image packaging nixpkgs.vector
mkImage {
  drv = pkgs.vector;
  name = "vector-fips";
  tag = "v${pkgs.vector.version}";
  entrypoint = [ (lib.getExe pkgs.vector) ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "vector-fips";
    "org.opencontainers.image.description" = "vector-fips container image (nixpkgs.vector)";
    "org.opencontainers.image.version" = pkgs.vector.version;
    "io.nix-containers.source" = "nixpkgs";
  };
}
