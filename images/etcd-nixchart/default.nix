{ mkImage, pkgs, lib, ... }:

# etcd-nixchart
# Container image packaging nixpkgs.etcd
mkImage {
  drv = pkgs.etcd;
  name = "etcd-nixchart";
  tag = "v${pkgs.etcd.version}";
  entrypoint = [ (lib.getExe pkgs.etcd) ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "etcd-nixchart";
    "org.opencontainers.image.description" = "etcd-nixchart container image (nixpkgs.etcd)";
    "org.opencontainers.image.version" = pkgs.etcd.version;
    "io.nix-containers.source" = "nixpkgs";
  };
}
