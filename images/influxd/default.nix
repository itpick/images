{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# influxd
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
  name = "influxd";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "influxd-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "influxd";
      "org.opencontainers.image.description" = "influxd container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
