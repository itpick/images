{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# influxdb-iamguarded
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
  name = "influxdb-iamguarded";
  tag = "latest";
  copyToRoot = [
    (buildEnv {
      name = "influxdb-iamguarded-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "influxdb-iamguarded";
      "org.opencontainers.image.description" = "influxdb-iamguarded container image";
    };
  };
}
