{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# newrelic-nri-statsd
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
  name = "newrelic-nri-statsd";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "newrelic-nri-statsd-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "newrelic nri statsd";
      "org.opencontainers.image.description" = "newrelic-nri-statsd container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
