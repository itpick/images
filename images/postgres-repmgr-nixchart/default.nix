{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# postgres-repmgr-nixchart
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
  name = "postgres-repmgr-nixchart";
  tag = "latest";
  copyToRoot = [
    (buildEnv {
      name = "postgres-repmgr-nixchart-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "postgres-repmgr-nixchart";
      "org.opencontainers.image.description" = "postgres-repmgr-nixchart container image";
    };
  };
}
