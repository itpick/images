{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# pgbouncer-iamguarded
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
  name = "pgbouncer-iamguarded";
  tag = "latest";
  copyToRoot = [
    (buildEnv {
      name = "pgbouncer-iamguarded-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "pgbouncer-iamguarded";
      "org.opencontainers.image.description" = "pgbouncer-iamguarded container image";
    };
  };
}
