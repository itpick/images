{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# pg_timetable
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
  name = "pg_timetable";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "pg_timetable-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "pg_timetaule";
      "org.opencontainers.image.description" = "pg_timetable container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
