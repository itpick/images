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
      "org.opencontainers.image.title" = "clickhouse keeper";
      "org.opencontainers.image.description" = "clickhouse-keeper container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
