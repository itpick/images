{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# newrelic-prometheus-configurator
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
  name = "newrelic-prometheus-configurator";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "newrelic-prometheus-configurator-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "newrelic prometheus configurator";
      "org.opencontainers.image.description" = "newrelic-prometheus-configurator container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
