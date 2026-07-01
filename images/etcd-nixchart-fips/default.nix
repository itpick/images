{ mkImage, pkgs, lib, ... }:

# etcd-nixchart-fips
# Container image packaging nixpkgs.etcd
mkImage {
  drv = pkgs.etcd;
  name = "etcd-nixchart-fips";
  tag = "v${pkgs.etcd.version}";
  entrypoint = [ (lib.getExe pkgs.etcd) ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "etcd-nixchart-fips";
    "org.opencontainers.image.description" = "etcd-nixchart-fips container image (nixpkgs.etcd)";
    "org.opencontainers.image.version" = pkgs.etcd.version;
    "io.nix-containers.source" = "nixpkgs";
  };
}
