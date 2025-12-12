{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# postgres-cloudnative-pg
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
  name = "postgres-cloudnative-pg";
  tag = "latest";
  copyToRoot = [
    (buildEnv {
      name = "postgres-cloudnative-pg-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "postgres-cloudnative-pg";
      "org.opencontainers.image.description" = "postgres-cloudnative-pg container image";
    };
  };
}
