{ mkImage, pkgs, lib, ... }:

# minio-client-iamguarded
# Container image packaging nixpkgs.minio-client
mkImage {
  drv = pkgs.minio-client;
  name = "minio-client-iamguarded";
  tag = "v${pkgs.minio-client.version}";
  entrypoint = [ (lib.getExe pkgs.minio-client) ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "minio-client-iamguarded";
    "org.opencontainers.image.description" = "minio-client-iamguarded container image (nixpkgs.minio-client)";
    "org.opencontainers.image.version" = pkgs.minio-client.version;
    "io.nix-containers.source" = "nixpkgs";
  };
}
