{ mkImage, pkgs, lib, ... }:

# valkey-nixchart-fips
# Container image packaging nixpkgs.valkey
mkImage {
  drv = pkgs.valkey;
  name = "valkey-nixchart-fips";
  tag = "v${pkgs.valkey.version}";
  entrypoint = [ (lib.getExe pkgs.valkey) ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "valkey-nixchart-fips";
    "org.opencontainers.image.description" = "valkey-nixchart-fips container image (nixpkgs.valkey)";
    "org.opencontainers.image.version" = pkgs.valkey.version;
    "io.nix-containers.source" = "nixpkgs";
  };
}
