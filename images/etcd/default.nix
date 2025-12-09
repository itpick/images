{ mkImage, pkgs, lib, ... }:

# Chainguard SBOM packages for etcd:
# Packages available in nixpkgs:
#   pkgs.etcd  # etcd-3.6 (3.6.6-r2)
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
# Packages NOT in nixpkgs:
#   ld-linux (2.42-r4)

mkImage {
  drv = pkgs.etcd;
  name = "etcd";
  tag = "v${pkgs.etcd.version}";
  entrypoint = [ "${pkgs.etcd}/bin/etcd" ];
  cmd = [ ];
  user = "0:0";  # etcd typically needs root for data directory access

  env = {
    ETCD_DATA_DIR = "/var/lib/etcd";
  };

  labels = {
    "org.opencontainers.image.title" = "etcd";
    "org.opencontainers.image.description" = "Distributed reliable key-value store for the most critical data of a distributed system";
    "org.opencontainers.image.version" = pkgs.etcd.version;
    "io.nix-containers.chart" = "etcd";
  };
}
