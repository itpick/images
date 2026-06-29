{ mkImage, pkgs, lib, ... }:

# etcd-iamguarded-fips
# Container image packaging nixpkgs.etcd
mkImage {
  drv = pkgs.etcd;
  name = "etcd-iamguarded-fips";
  tag = "v${pkgs.etcd.version}";
  entrypoint = [ (lib.getExe pkgs.etcd) ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "etcd-iamguarded-fips";
    "org.opencontainers.image.description" = "etcd-iamguarded-fips container image (nixpkgs.etcd)";
    "org.opencontainers.image.version" = pkgs.etcd.version;
    "io.nix-containers.source" = "nixpkgs";
  };
}
