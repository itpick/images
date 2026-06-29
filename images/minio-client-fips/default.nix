{ mkImage, pkgs, lib, ... }:

# minio-client-fips
# Container image packaging nixpkgs.minio-client
mkImage {
  drv = pkgs.minio-client;
  name = "minio-client-fips";
  tag = "v${pkgs.minio-client.version}";
  entrypoint = [ (lib.getExe pkgs.minio-client) ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "minio-client-fips";
    "org.opencontainers.image.description" = "minio-client-fips container image (nixpkgs.minio-client)";
    "org.opencontainers.image.version" = pkgs.minio-client.version;
    "io.nix-containers.source" = "nixpkgs";
  };
}
