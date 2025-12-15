{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# clickhouse-operator-fips-metrics-exporter
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
  name = "clickhouse-operator-fips-metrics-exporter";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "clickhouse-operator-fips-metrics-exporter-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "clickhouse operator fips metrics exporter";
      "org.opencontainers.image.description" = "clickhouse-operator-fips-metrics-exporter container image";
      "org.opencontainers.image.version" = version;
    "io.nix-containers.compliance" = "FIPS-140-2";
    };
  };
}
