{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# vertical-pod-autoscaler-recommender-fips
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
  name = "vertical-pod-autoscaler-recommender-fips";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "vertical-pod-autoscaler-recommender-fips-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "vertical pod autoscaler recommender fips";
      "org.opencontainers.image.description" = "vertical-pod-autoscaler-recommender-fips container image";
      "org.opencontainers.image.version" = version;
    "io.nix-containers.compliance" = "FIPS-140-2";
    };
  };
}
