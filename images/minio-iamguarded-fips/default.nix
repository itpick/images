{ mkImage, pkgs, lib, ... }:

# minio-iamguarded-fips
# Container image packaging nixpkgs.minio
mkImage {
  drv = pkgs.minio;
  name = "minio-iamguarded-fips";
  tag = "v${pkgs.minio.version}";
  entrypoint = [ (lib.getExe pkgs.minio) ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "minio-iamguarded-fips";
    "org.opencontainers.image.description" = "minio-iamguarded-fips container image (nixpkgs.minio)";
    "org.opencontainers.image.version" = pkgs.minio.version;
    "io.nix-containers.source" = "nixpkgs";
  };
}
