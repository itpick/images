{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# kubectl-iamguarded
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
  name = "kubectl-iamguarded";
  tag = "latest";
  copyToRoot = [
    (buildEnv {
      name = "kubectl-iamguarded-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "kubectl-iamguarded";
      "org.opencontainers.image.description" = "kubectl-iamguarded container image";
    };
  };
}
