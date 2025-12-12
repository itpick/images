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
      "org.opencontainers.image.title" = "ceph-csi-operator";
      "org.opencontainers.image.description" = "ceph-csi-operator container image";
    };
  };
}
