{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# airflow-nixchart
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
  name = "airflow-nixchart";
  tag = "latest";
  copyToRoot = [
    (buildEnv {
      name = "airflow-nixchart-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "airflow-nixchart";
      "org.opencontainers.image.description" = "airflow-nixchart container image";
    };
  };
}
