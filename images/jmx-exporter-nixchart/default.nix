{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# jmx-exporter-nixchart
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
  name = "jmx-exporter-nixchart";
  tag = "latest";
  copyToRoot = [
    (buildEnv {
      name = "jmx-exporter-nixchart-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "jmx-exporter-nixchart";
      "org.opencontainers.image.description" = "jmx-exporter-nixchart container image";
    };
  };
}
