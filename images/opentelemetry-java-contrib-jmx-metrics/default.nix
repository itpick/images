{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# opentelemetry-java-contrib-jmx-metrics
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
  name = "opentelemetry-java-contrib-jmx-metrics";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "opentelemetry-java-contrib-jmx-metrics-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "opentelemetry java contriu jmx metrics";
      "org.opencontainers.image.description" = "opentelemetry-java-contrib-jmx-metrics container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
