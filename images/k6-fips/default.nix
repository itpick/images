{ mkImage, pkgs, lib, ... }:

# k6-fips
# Container image packaging nixpkgs.k6
mkImage {
  drv = pkgs.k6;
  name = "k6-fips";
  tag = "v${pkgs.k6.version}";
  entrypoint = [ (lib.getExe pkgs.k6) ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "k6-fips";
    "org.opencontainers.image.description" = "k6-fips container image (nixpkgs.k6)";
    "org.opencontainers.image.version" = pkgs.k6.version;
    "io.nix-containers.source" = "nixpkgs";
  };
}
