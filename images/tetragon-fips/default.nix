{ mkImage, pkgs, lib, ... }:

# tetragon-fips
# Container image packaging nixpkgs.tetragon
mkImage {
  drv = pkgs.tetragon;
  name = "tetragon-fips";
  tag = "v${pkgs.tetragon.version}";
  entrypoint = [ (lib.getExe pkgs.tetragon) ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "tetragon-fips";
    "org.opencontainers.image.description" = "tetragon-fips container image (nixpkgs.tetragon)";
    "org.opencontainers.image.version" = pkgs.tetragon.version;
    "io.nix-containers.source" = "nixpkgs";
  };
}
