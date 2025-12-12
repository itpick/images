{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# custom-pod-autoscaler-operator
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
  name = "custom-pod-autoscaler-operator";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "custom-pod-autoscaler-operator-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "custom pod autoscaler operator";
      "org.opencontainers.image.description" = "custom-pod-autoscaler-operator container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
