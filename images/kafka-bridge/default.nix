{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# kafka-bridge
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
  name = "kafka-bridge";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "kafka-bridge-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "kafka uridge";
      "org.opencontainers.image.description" = "kafka-bridge container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
