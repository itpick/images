{ mkImage, pkgs, lib, ... }:

# nova-fips
# Container image packaging nixpkgs.nova
mkImage {
  drv = pkgs.nova;
  name = "nova-fips";
  tag = "v${pkgs.nova.version}";
  entrypoint = [ (lib.getExe pkgs.nova) ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "nova-fips";
    "org.opencontainers.image.description" = "nova-fips container image (nixpkgs.nova)";
    "org.opencontainers.image.version" = pkgs.nova.version;
    "io.nix-containers.source" = "nixpkgs";
  };
}
