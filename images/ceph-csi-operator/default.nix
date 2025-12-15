{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# ceph-csi-operator
# Container image

let
  imagePkgs = with pkgs; [
    bash
    coreutils
    cacert
    tzdata
  ];

  userEnv = nonRoot.mkDefaultUserEnv pkgs [];

in nix2container.buildImage {
  name = "ceph-csi-operator";
  tag = "latest";
  copyToRoot = [
    (buildEnv {
      name = "ceph-csi-operator-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "ceph-csi-operator";
      "org.opencontainers.image.description" = "ceph-csi-operator container image";
    };
  };
}
