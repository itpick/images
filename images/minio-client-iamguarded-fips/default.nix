{ mkImage, pkgs, lib, ... }:

# minio-client-iamguarded-fips
# Container image packaging nixpkgs.minio-client
mkImage {
  drv = pkgs.minio-client;
  name = "minio-client-iamguarded-fips";
  tag = "v${pkgs.minio-client.version}";
  entrypoint = [ (lib.getExe pkgs.minio-client) ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "minio-client-iamguarded-fips";
    "org.opencontainers.image.description" = "minio-client-iamguarded-fips container image (nixpkgs.minio-client)";
    "org.opencontainers.image.version" = pkgs.minio-client.version;
    "io.nix-containers.source" = "nixpkgs";
  };
}
