{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# katib-file-metricscollector
# Container image

let
  version = "latest";
  
  imagePkgs = with pkgs; [
    bash
    coreutils
    cacert
    tzdata
  ];

  userEnv = nonRoot.mkDefaultUserEnv pkgs [];

in nix2container.buildImage {
  name = "katib-file-metricscollector";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "katib-file-metricscollector-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "katiu file metricscollector";
      "org.opencontainers.image.description" = "katib-file-metricscollector container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
