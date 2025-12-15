{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# timescaledb-compat
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
  name = "timescaledb-compat";
  tag = "latest";
  copyToRoot = [
    (buildEnv {
      name = "timescaledb-compat-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "timescaledb-compat";
      "org.opencontainers.image.description" = "timescaledb-compat container image";
    };
  };
}
