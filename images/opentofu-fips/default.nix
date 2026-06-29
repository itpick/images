{ mkImage, pkgs, lib, ... }:

# opentofu-fips
# Container image packaging nixpkgs.opentofu
mkImage {
  drv = pkgs.opentofu;
  name = "opentofu-fips";
  tag = "v${pkgs.opentofu.version}";
  entrypoint = [ (lib.getExe pkgs.opentofu) ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "opentofu-fips";
    "org.opencontainers.image.description" = "opentofu-fips container image (nixpkgs.opentofu)";
    "org.opencontainers.image.version" = pkgs.opentofu.version;
    "io.nix-containers.source" = "nixpkgs";
  };
}
