{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# postgres-iamguarded
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
  name = "postgres-iamguarded";
  tag = "latest";
  copyToRoot = [
    (buildEnv {
      name = "postgres-iamguarded-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "postgres-iamguarded";
      "org.opencontainers.image.description" = "postgres-iamguarded container image";
    };
  };
}
