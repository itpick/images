{ mkImage, pkgs, lib, ... }:

# ant-fips
# Container image packaging nixpkgs.ant
mkImage {
  drv = pkgs.ant;
  name = "ant-fips";
  tag = "v${pkgs.ant.version}";
  entrypoint = [ (lib.getExe pkgs.ant) ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "ant-fips";
    "org.opencontainers.image.description" = "ant-fips container image (nixpkgs.ant)";
    "org.opencontainers.image.version" = pkgs.ant.version;
    "io.nix-containers.source" = "nixpkgs";
  };
}
