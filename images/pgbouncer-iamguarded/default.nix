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
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "pgbouncer-iamguarded";
      "org.opencontainers.image.description" = "pgbouncer-iamguarded container image";
    };
  };
}
