{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# redis-benchmark
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
  name = "redis-benchmark";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "redis-benchmark-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "redis uenchmark";
      "org.opencontainers.image.description" = "redis-benchmark container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
