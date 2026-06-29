{ mkImage, pkgs, lib, ... }:

# nats-top-fips
# Container image packaging nixpkgs.nats-top
mkImage {
  drv = pkgs.nats-top;
  name = "nats-top-fips";
  tag = "v${pkgs.nats-top.version}";
  entrypoint = [ (lib.getExe pkgs.nats-top) ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "nats-top-fips";
    "org.opencontainers.image.description" = "nats-top-fips container image (nixpkgs.nats-top)";
    "org.opencontainers.image.version" = pkgs.nats-top.version;
    "io.nix-containers.source" = "nixpkgs";
  };
}
