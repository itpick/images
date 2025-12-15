{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# nginx-prometheus-exporter
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
  name = "nginx-prometheus-exporter";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "nginx-prometheus-exporter-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "nginx prometheus exporter";
      "org.opencontainers.image.description" = "nginx-prometheus-exporter container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
