{ mkImage, pkgs, lib, ... }:

# minio-fips
# Container image packaging nixpkgs.minio
mkImage {
  drv = pkgs.minio;
  name = "minio-fips";
  tag = "v${pkgs.minio.version}";
  entrypoint = [ (lib.getExe pkgs.minio) ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "minio-fips";
    "org.opencontainers.image.description" = "minio-fips container image (nixpkgs.minio)";
    "org.opencontainers.image.version" = pkgs.minio.version;
    "io.nix-containers.source" = "nixpkgs";
  };
}
