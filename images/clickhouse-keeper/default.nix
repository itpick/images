{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# clickhouse-keeper
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
  name = "clickhouse-keeper";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "clickhouse-keeper-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "clickhouse keeper";
      "org.opencontainers.image.description" = "clickhouse-keeper container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
