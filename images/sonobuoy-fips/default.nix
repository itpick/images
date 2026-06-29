{ mkImage, pkgs, lib, ... }:

# sonobuoy-fips
# Container image packaging nixpkgs.sonobuoy
mkImage {
  drv = pkgs.sonobuoy;
  name = "sonobuoy-fips";
  tag = "v${pkgs.sonobuoy.version}";
  entrypoint = [ (lib.getExe pkgs.sonobuoy) ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "sonobuoy-fips";
    "org.opencontainers.image.description" = "sonobuoy-fips container image (nixpkgs.sonobuoy)";
    "org.opencontainers.image.version" = pkgs.sonobuoy.version;
    "io.nix-containers.source" = "nixpkgs";
  };
}
