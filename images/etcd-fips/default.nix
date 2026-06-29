{ mkImage, pkgs, lib, ... }:

# etcd-fips
# Container image packaging nixpkgs.etcd
mkImage {
  drv = pkgs.etcd;
  name = "etcd-fips";
  tag = "v${pkgs.etcd.version}";
  entrypoint = [ (lib.getExe pkgs.etcd) ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "etcd-fips";
    "org.opencontainers.image.description" = "etcd-fips container image (nixpkgs.etcd)";
    "org.opencontainers.image.version" = pkgs.etcd.version;
    "io.nix-containers.source" = "nixpkgs";
  };
}
