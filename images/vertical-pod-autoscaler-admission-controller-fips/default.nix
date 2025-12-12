{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# vertical-pod-autoscaler-admission-controller-fips
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
  name = "vertical-pod-autoscaler-admission-controller-fips";
  tag = "latest";
  copyToRoot = [
    (buildEnv {
      name = "vertical-pod-autoscaler-admission-controller-fips-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "vertical-pod-autoscaler-admission-controller-fips";
      "org.opencontainers.image.description" = "vertical-pod-autoscaler-admission-controller-fips container image";
    "io.nix-containers.compliance" = "FIPS-140-2";
    };
  };
}
