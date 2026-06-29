{ mkImage, pkgs, lib, ... }:

# jre-fips
# Container image packaging nixpkgs.jre
mkImage {
  drv = pkgs.jre;
  name = "jre-fips";
  tag = "v${pkgs.jre.version}";
  entrypoint = [ (lib.getExe pkgs.jre) ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "jre-fips";
    "org.opencontainers.image.description" = "jre-fips container image (nixpkgs.jre)";
    "org.opencontainers.image.version" = pkgs.jre.version;
    "io.nix-containers.source" = "nixpkgs";
  };
}
