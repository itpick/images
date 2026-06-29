{ mkImage, pkgs, lib, ... }:

# rekor-server-fips
# Container image packaging nixpkgs.rekor-server
mkImage {
  drv = pkgs.rekor-server;
  name = "rekor-server-fips";
  tag = "v${pkgs.rekor-server.version}";
  entrypoint = [ (lib.getExe pkgs.rekor-server) ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "rekor-server-fips";
    "org.opencontainers.image.description" = "rekor-server-fips container image (nixpkgs.rekor-server)";
    "org.opencontainers.image.version" = pkgs.rekor-server.version;
    "io.nix-containers.source" = "nixpkgs";
  };
}
