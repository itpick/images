{ mkImage, pkgs, lib, ... }:

# minio-client-nixchart
# Container image packaging nixpkgs.minio-client
mkImage {
  drv = pkgs.minio-client;
  name = "minio-client-nixchart";
  tag = "v${pkgs.minio-client.version}";
  entrypoint = [ (lib.getExe pkgs.minio-client) ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "minio-client-nixchart";
    "org.opencontainers.image.description" = "minio-client-nixchart container image (nixpkgs.minio-client)";
    "org.opencontainers.image.version" = pkgs.minio-client.version;
    "io.nix-containers.source" = "nixpkgs";
  };
}
