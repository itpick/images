{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# temporal-cassandra-tool
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
  name = "temporal-cassandra-tool";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "temporal-cassandra-tool-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "temporal cassandra tool";
      "org.opencontainers.image.description" = "temporal-cassandra-tool container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
