{ mkImage, pkgs, lib, ... }:

# valkey-iamguarded-fips
# Container image packaging nixpkgs.valkey
mkImage {
  drv = pkgs.valkey;
  name = "valkey-iamguarded-fips";
  tag = "v${pkgs.valkey.version}";
  entrypoint = [ (lib.getExe pkgs.valkey) ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "valkey-iamguarded-fips";
    "org.opencontainers.image.description" = "valkey-iamguarded-fips container image (nixpkgs.valkey)";
    "org.opencontainers.image.version" = pkgs.valkey.version;
    "io.nix-containers.source" = "nixpkgs";
  };
}
