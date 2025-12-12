{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# gcp-compute-persistent-disk-csi-driver
# Container image

let
  version = "latest";
  
  imagePkgs = with pkgs; [
    bash
    coreutils
    cacert
    tzdata
  ];

  userEnv = nonRoot.mkDefaultUserEnv pkgs [];

in nix2container.buildImage {
  name = "gcp-compute-persistent-disk-csi-driver";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "gcp-compute-persistent-disk-csi-driver-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "gcp compute persistent disk csi driver";
      "org.opencontainers.image.description" = "gcp-compute-persistent-disk-csi-driver container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
