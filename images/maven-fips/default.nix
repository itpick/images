{ mkImage, pkgs, lib, ... }:

# maven-fips
# Container image packaging nixpkgs.maven
mkImage {
  drv = pkgs.maven;
  name = "maven-fips";
  tag = "v${pkgs.maven.version}";
  entrypoint = [ (lib.getExe pkgs.maven) ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "maven-fips";
    "org.opencontainers.image.description" = "maven-fips container image (nixpkgs.maven)";
    "org.opencontainers.image.version" = pkgs.maven.version;
    "io.nix-containers.source" = "nixpkgs";
  };
}
