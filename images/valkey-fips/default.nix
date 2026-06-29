{ mkImage, pkgs, lib, ... }:

# valkey-fips
# Container image packaging nixpkgs.valkey
mkImage {
  drv = pkgs.valkey;
  name = "valkey-fips";
  tag = "v${pkgs.valkey.version}";
  entrypoint = [ (lib.getExe pkgs.valkey) ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "valkey-fips";
    "org.opencontainers.image.description" = "valkey-fips container image (nixpkgs.valkey)";
    "org.opencontainers.image.version" = pkgs.valkey.version;
    "io.nix-containers.source" = "nixpkgs";
  };
}
