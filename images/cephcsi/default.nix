# cephcsi
# =============
# Ceph CSI (Container Storage Interface) driver
# https://github.com/ceph/ceph-csi

{ mkImage, pkgs, lib, ... }:

# Chainguard SBOM packages for cephcsi:
# Packages available in nixpkgs:
#   pkgs.ceph-csi  # ceph-csi (3.15.1)

mkImage {
  drv = pkgs.ceph-csi;
  name = "cephcsi";
  tag = "v${pkgs.ceph-csi.version}";
  entrypoint = [ "${pkgs.ceph-csi}/bin/cephcsi" ];
  cmd = [];

  extraPkgs = with pkgs; [
    ceph          # Ceph client libraries
    e2fsprogs     # ext filesystem tools
    xfsprogs      # XFS tools
    util-linux    # mount utilities
    cryptsetup    # LUKS encryption
    lvm2          # LVM utilities
    bash          # Shell for scripts
  ];

  labels = {
    "org.opencontainers.image.title" = "Ceph CSI";
    "org.opencontainers.image.description" = "Container Storage Interface driver for Ceph RBD and CephFS";
    "org.opencontainers.image.version" = pkgs.ceph-csi.version;
    "io.nix-containers.chart" = "rook-ceph";
  };
}
