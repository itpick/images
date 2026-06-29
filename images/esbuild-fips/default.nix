{ mkImage, pkgs, lib, ... }:

# esbuild-fips
# Container image packaging nixpkgs.esbuild
mkImage {
  drv = pkgs.esbuild;
  name = "esbuild-fips";
  tag = "v${pkgs.esbuild.version}";
  entrypoint = [ (lib.getExe pkgs.esbuild) ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "esbuild-fips";
    "org.opencontainers.image.description" = "esbuild-fips container image (nixpkgs.esbuild)";
    "org.opencontainers.image.version" = pkgs.esbuild.version;
    "io.nix-containers.source" = "nixpkgs";
  };
}
