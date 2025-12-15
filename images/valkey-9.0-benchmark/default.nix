{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# valkey-9.0-benchmark
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
  name = "valkey-9.0-benchmark";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "valkey-9.0-benchmark-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "valkey 9.0 uenchmark";
      "org.opencontainers.image.description" = "valkey-9.0-benchmark container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
