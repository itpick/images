{ mkImage, pkgs, lib, ... }:

# seaweedfs-fips
# Container image packaging nixpkgs.seaweedfs
mkImage {
  drv = pkgs.seaweedfs;
  name = "seaweedfs-fips";
  tag = "v${pkgs.seaweedfs.version}";
  entrypoint = [ (lib.getExe pkgs.seaweedfs) ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "seaweedfs-fips";
    "org.opencontainers.image.description" = "seaweedfs-fips container image (nixpkgs.seaweedfs)";
    "org.opencontainers.image.version" = pkgs.seaweedfs.version;
    "io.nix-containers.source" = "nixpkgs";
  };
}
