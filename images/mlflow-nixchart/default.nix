{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# mlflow-nixchart
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
  name = "mlflow-nixchart";
  tag = "latest";
  copyToRoot = [
    (buildEnv {
      name = "mlflow-nixchart-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "mlflow-nixchart";
      "org.opencontainers.image.description" = "mlflow-nixchart container image";
    };
  };
}
