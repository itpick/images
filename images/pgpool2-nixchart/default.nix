{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# pgpool2-nixchart
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
  name = "pgpool2-nixchart";
  tag = "latest";
  copyToRoot = [
    (buildEnv {
      name = "pgpool2-nixchart-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "pgpool2-nixchart";
      "org.opencontainers.image.description" = "pgpool2-nixchart container image";
    };
  };
}
