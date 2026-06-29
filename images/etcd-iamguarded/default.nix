{ mkImage, pkgs, lib, ... }:

# etcd-iamguarded
# Container image packaging nixpkgs.etcd
mkImage {
  drv = pkgs.etcd;
  name = "etcd-iamguarded";
  tag = "v${pkgs.etcd.version}";
  entrypoint = [ (lib.getExe pkgs.etcd) ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "etcd-iamguarded";
    "org.opencontainers.image.description" = "etcd-iamguarded container image (nixpkgs.etcd)";
    "org.opencontainers.image.version" = pkgs.etcd.version;
    "io.nix-containers.source" = "nixpkgs";
  };
}
