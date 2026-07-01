{ mkImage, pkgs, lib, ... }:

# valkey-nixchart
# Container image packaging nixpkgs.valkey
mkImage {
  drv = pkgs.valkey;
  name = "valkey-nixchart";
  tag = "v${pkgs.valkey.version}";
  entrypoint = [ (lib.getExe pkgs.valkey) ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "valkey-nixchart";
    "org.opencontainers.image.description" = "valkey-nixchart container image (nixpkgs.valkey)";
    "org.opencontainers.image.version" = pkgs.valkey.version;
    "io.nix-containers.source" = "nixpkgs";
  };
}
