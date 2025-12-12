{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# gpu-operator-validator
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
  name = "gpu-operator-validator";
  tag = "latest";
  copyToRoot = [
    (buildEnv {
      name = "gpu-operator-validator-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "gpu-operator-validator";
      "org.opencontainers.image.description" = "gpu-operator-validator container image";
    };
  };
}
