{ mkImage, pkgs, lib, ... }:

# buildkit-fips
# Container image packaging nixpkgs.buildkit
mkImage {
  drv = pkgs.buildkit;
  name = "buildkit-fips";
  tag = "v${pkgs.buildkit.version}";
  entrypoint = [ (lib.getExe pkgs.buildkit) ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "buildkit-fips";
    "org.opencontainers.image.description" = "buildkit-fips container image (nixpkgs.buildkit)";
    "org.opencontainers.image.version" = pkgs.buildkit.version;
    "io.nix-containers.source" = "nixpkgs";
  };
}
