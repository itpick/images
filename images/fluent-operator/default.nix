{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# fluent-operator
# Fluent logging component

let
  version = "3.2.0";
  
  fluentPkgs = with pkgs; [
    fluentd
    bash
    coreutils
    cacert
  ];

  userEnv = nonRoot.mkDefaultUserEnv pkgs [];

in
nix2container.buildImage {
  name = "fluent-operator";
  tag = version;

  copyToRoot = [
    (buildEnv {
      name = "fluent-operator-root";
      paths = base.basePackages ++ fluentPkgs ++ [ userEnv ];
    })
  ];

  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "fluent operator";
      "org.opencontainers.image.description" = "Fluent logging fluent-operator";
      "org.opencontainers.image.version" = version;
      "io.nix-containers.chart" = "fluent";
    };
  };
}
