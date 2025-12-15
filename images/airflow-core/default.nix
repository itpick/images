{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# airflow-core
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
  name = "airflow-core";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "airflow-core-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "airflow core";
      "org.opencontainers.image.description" = "airflow-core container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
