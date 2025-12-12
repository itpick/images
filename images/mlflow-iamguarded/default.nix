{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# mlflow-iamguarded
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
  name = "mlflow-iamguarded";
  tag = "latest";
  copyToRoot = [
    (buildEnv {
      name = "mlflow-iamguarded-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "mlflow-iamguarded";
      "org.opencontainers.image.description" = "mlflow-iamguarded container image";
    };
  };
}
