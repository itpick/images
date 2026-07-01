{ mkImage, pkgs, lib, ... }:

# minio-nixchart
# Container image packaging nixpkgs.minio
mkImage {
  drv = pkgs.minio;
  name = "minio-nixchart";
  tag = "v${pkgs.minio.version}";
  entrypoint = [ (lib.getExe pkgs.minio) ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "minio-nixchart";
    "org.opencontainers.image.description" = "minio-nixchart container image (nixpkgs.minio)";
    "org.opencontainers.image.version" = pkgs.minio.version;
    "io.nix-containers.source" = "nixpkgs";
  };
}
