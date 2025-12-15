{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# clickhouse-operator-metrics-exporter
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
  name = "clickhouse-operator-metrics-exporter";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "clickhouse-operator-metrics-exporter-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "clickhouse operator metrics exporter";
      "org.opencontainers.image.description" = "clickhouse-operator-metrics-exporter container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
