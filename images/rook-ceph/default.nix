# rook-ceph
# =============
# Rook Ceph toolbox image with Ceph tools for cluster management
# https://github.com/rook/rook

{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# Chainguard SBOM packages for rook-ceph:
# Packages available in nixpkgs:
#   pkgs.ceph  # ceph-19 (19.2.3-r12)

# This image provides a toolbox environment with Ceph CLI tools
# for managing and troubleshooting Rook-Ceph clusters

let
  rookCephPackages = with pkgs; [
    ceph          # Full Ceph distribution with CLI tools
    bash
    coreutils
    iproute2
    jq
    curl
    procps
    util-linux
    e2fsprogs
    xfsprogs
    lvm2
    cryptsetup
  ];

  userEnv = nonRoot.mkDefaultUserEnv pkgs [];

in
nix2container.buildImage {
  name = "rook-ceph";
  tag = pkgs.ceph.version;

  copyToRoot = [
    (buildEnv {
      name = "rook-ceph-root";
      paths = base.basePackages ++ rookCephPackages ++ [ userEnv ];
    })
  ];

  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv ++ [
      "PATH=${lib.makeBinPath rookCephPackages}"
      "CEPH_CONF=/etc/ceph/ceph.conf"
    ];
    Entrypoint = [ "${pkgs.bash}/bin/bash" ];
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "Rook Ceph Toolbox";
      "org.opencontainers.image.description" = "Rook Ceph toolbox with CLI tools for cluster management";
      "org.opencontainers.image.version" = pkgs.ceph.version;
      "io.nix-containers.chart" = "rook-ceph";
    };
  };
}
