{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# vertical-pod-autoscaler-recommender
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
  name = "vertical-pod-autoscaler-recommender";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "vertical-pod-autoscaler-recommender-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "vertical pod autoscaler recommender";
      "org.opencontainers.image.description" = "vertical-pod-autoscaler-recommender container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
