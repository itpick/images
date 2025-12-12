{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# psqlodbc
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
  name = "psqlodbc";
  tag = "latest";
  copyToRoot = [
    (buildEnv {
      name = "psqlodbc-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "psqlodbc";
      "org.opencontainers.image.description" = "psqlodbc container image";
    };
  };
}
