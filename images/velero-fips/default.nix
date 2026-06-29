{ mkImage, pkgs, lib, ... }:

# velero-fips
# Container image packaging nixpkgs.velero
mkImage {
  drv = pkgs.velero;
  name = "velero-fips";
  tag = "v${pkgs.velero.version}";
  entrypoint = [ (lib.getExe pkgs.velero) ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "velero-fips";
    "org.opencontainers.image.description" = "velero-fips container image (nixpkgs.velero)";
    "org.opencontainers.image.version" = pkgs.velero.version;
    "io.nix-containers.source" = "nixpkgs";
  };
}
