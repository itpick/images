# ceph
# =============
# Ceph distributed storage system
# https://ceph.io/

{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# Chainguard SBOM packages for ceph:
# Packages available in nixpkgs:
#   pkgs.ceph  # ceph-19 (19.2.3-r13)

let
  cephPackages = with pkgs; [
    ceph          # Ceph distributed storage
    bash          # Shell
    coreutils     # Basic utilities
    iproute2      # Network utilities
    jq            # JSON processing
    curl          # HTTP client
    procps        # Process utilities
    util-linux    # System utilities
    e2fsprogs     # Filesystem utilities
    xfsprogs      # XFS utilities
    lvm2          # LVM utilities
    cryptsetup    # Disk encryption
    parted        # Partitioning
  ];

  userEnv = nonRoot.mkDefaultUserEnv pkgs [];

in
nix2container.buildImage {
  name = "ceph";
  tag = pkgs.ceph.version;

  copyToRoot = [
    (buildEnv {
      name = "ceph-root";
      paths = base.basePackages ++ cephPackages ++ [ userEnv ];
    })
  ];

  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv ++ [
      "PATH=${lib.makeBinPath cephPackages}"
      "CEPH_CONF=/etc/ceph/ceph.conf"
    ];
    Entrypoint = [ "${pkgs.ceph}/bin/ceph" ];
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "Ceph";
      "org.opencontainers.image.description" = "Ceph distributed storage system";
      "org.opencontainers.image.version" = pkgs.ceph.version;
      "io.nix-containers.chart" = "rook-ceph";
    };
  };
}
