{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# vertical-pod-autoscaler-updater
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
  name = "vertical-pod-autoscaler-updater";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "vertical-pod-autoscaler-updater-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "vertical pod autoscaler updater";
      "org.opencontainers.image.description" = "vertical-pod-autoscaler-updater container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
