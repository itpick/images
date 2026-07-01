{ mkImage, pkgs, lib, ... }:

# minio-nixchart-fips
# Container image packaging nixpkgs.minio
mkImage {
  drv = pkgs.minio;
  name = "minio-nixchart-fips";
  tag = "v${pkgs.minio.version}";
  entrypoint = [ (lib.getExe pkgs.minio) ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "minio-nixchart-fips";
    "org.opencontainers.image.description" = "minio-nixchart-fips container image (nixpkgs.minio)";
    "org.opencontainers.image.version" = pkgs.minio.version;
    "io.nix-containers.source" = "nixpkgs";
  };
}
