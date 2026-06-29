{ mkImage, pkgs, lib, ... }:

# minio-iamguarded
# Container image packaging nixpkgs.minio
mkImage {
  drv = pkgs.minio;
  name = "minio-iamguarded";
  tag = "v${pkgs.minio.version}";
  entrypoint = [ (lib.getExe pkgs.minio) ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "minio-iamguarded";
    "org.opencontainers.image.description" = "minio-iamguarded container image (nixpkgs.minio)";
    "org.opencontainers.image.version" = pkgs.minio.version;
    "io.nix-containers.source" = "nixpkgs";
  };
}
