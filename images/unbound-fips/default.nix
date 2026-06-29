{ mkImage, pkgs, lib, ... }:

# unbound-fips
# Container image packaging nixpkgs.unbound
mkImage {
  drv = pkgs.unbound;
  name = "unbound-fips";
  tag = "v${pkgs.unbound.version}";
  entrypoint = [ (lib.getExe pkgs.unbound) ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "unbound-fips";
    "org.opencontainers.image.description" = "unbound-fips container image (nixpkgs.unbound)";
    "org.opencontainers.image.version" = pkgs.unbound.version;
    "io.nix-containers.source" = "nixpkgs";
  };
}
