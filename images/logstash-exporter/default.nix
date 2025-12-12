{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# logstash-exporter
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
  name = "logstash-exporter";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "logstash-exporter-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "logstash exporter";
      "org.opencontainers.image.description" = "logstash-exporter container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
