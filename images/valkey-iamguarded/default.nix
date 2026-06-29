{ mkImage, pkgs, lib, ... }:

# valkey-iamguarded
# Container image packaging nixpkgs.valkey
mkImage {
  drv = pkgs.valkey;
  name = "valkey-iamguarded";
  tag = "v${pkgs.valkey.version}";
  entrypoint = [ (lib.getExe pkgs.valkey) ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "valkey-iamguarded";
    "org.opencontainers.image.description" = "valkey-iamguarded container image (nixpkgs.valkey)";
    "org.opencontainers.image.version" = pkgs.valkey.version;
    "io.nix-containers.source" = "nixpkgs";
  };
}
