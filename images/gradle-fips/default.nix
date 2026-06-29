{ mkImage, pkgs, lib, ... }:

# gradle-fips
# Container image packaging nixpkgs.gradle
mkImage {
  drv = pkgs.gradle;
  name = "gradle-fips";
  tag = "v${pkgs.gradle.version}";
  entrypoint = [ (lib.getExe pkgs.gradle) ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "gradle-fips";
    "org.opencontainers.image.description" = "gradle-fips container image (nixpkgs.gradle)";
    "org.opencontainers.image.version" = pkgs.gradle.version;
    "io.nix-containers.source" = "nixpkgs";
  };
}
