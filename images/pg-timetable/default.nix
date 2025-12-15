{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# pg-timetable
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
  name = "pg-timetable";
  tag = "latest";
  copyToRoot = [
    (buildEnv {
      name = "pg-timetable-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "pg-timetable";
      "org.opencontainers.image.description" = "pg-timetable container image";
    };
  };
}
