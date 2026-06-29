{ mkImage, pkgs, lib, ... }:

# tomcat-fips
# Container image packaging nixpkgs.tomcat
mkImage {
  drv = pkgs.tomcat;
  name = "tomcat-fips";
  tag = "v${pkgs.tomcat.version}";
  entrypoint = [ (lib.getExe pkgs.tomcat) ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "tomcat-fips";
    "org.opencontainers.image.description" = "tomcat-fips container image (nixpkgs.tomcat)";
    "org.opencontainers.image.version" = pkgs.tomcat.version;
    "io.nix-containers.source" = "nixpkgs";
  };
}
