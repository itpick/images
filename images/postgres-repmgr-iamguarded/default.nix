{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# postgres-repmgr-iamguarded
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
  name = "postgres-repmgr-iamguarded";
  tag = "latest";
  copyToRoot = [
    (buildEnv {
      name = "postgres-repmgr-iamguarded-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "postgres-repmgr-iamguarded";
      "org.opencontainers.image.description" = "postgres-repmgr-iamguarded container image";
    };
  };
}
