{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# kafka_exporter
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
  name = "kafka_exporter";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "kafka_exporter-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "kafka_exporter";
      "org.opencontainers.image.description" = "kafka_exporter container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
