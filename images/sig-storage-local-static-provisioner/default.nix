{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# sig-storage-local-static-provisioner - Kubernetes local volume provisioner
# Manages local persistent volumes on Kubernetes nodes

let
  imagePkgs = with pkgs; [
    bash
    coreutils
    util-linux  # For mount, blkid, etc.
    e2fsprogs   # For filesystem tools
    cacert
    tzdata
  ];

  userEnv = nonRoot.mkDefaultUserEnv pkgs [];

in nix2container.buildImage {
  name = "sig-storage-local-static-provisioner";
  tag = "latest";

  copyToRoot = [
    (buildEnv {
      name = "sig-storage-local-static-provisioner-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];

  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv ++ [
      "PATH=${lib.makeBinPath imagePkgs}"
    ];
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "sig-storage-local-static-provisioner";
      "org.opencontainers.image.description" = "Kubernetes local volume provisioner from sig-storage";
    };
  };
}
