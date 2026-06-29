{ mkImage, pkgs, lib, ... }:

# cadvisor-fips
# Container image packaging nixpkgs.cadvisor
mkImage {
  drv = pkgs.cadvisor;
  name = "cadvisor-fips";
  tag = "v${pkgs.cadvisor.version}";
  entrypoint = [ (lib.getExe pkgs.cadvisor) ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "cadvisor-fips";
    "org.opencontainers.image.description" = "cadvisor-fips container image (nixpkgs.cadvisor)";
    "org.opencontainers.image.version" = pkgs.cadvisor.version;
    "io.nix-containers.source" = "nixpkgs";
  };
}
