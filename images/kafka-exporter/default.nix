{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# kafka-exporter
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
  name = "kafka-exporter";
  tag = "latest";
  copyToRoot = [
    (buildEnv {
      name = "kafka-exporter-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "kafka-exporter";
      "org.opencontainers.image.description" = "kafka-exporter container image";
    };
  };
}
