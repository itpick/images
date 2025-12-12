{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# clickhouse-keeper-iamguarded
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
  name = "clickhouse-keeper-iamguarded";
  tag = "latest";
  copyToRoot = [
    (buildEnv {
      name = "clickhouse-keeper-iamguarded-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "clickhouse-keeper-iamguarded";
      "org.opencontainers.image.description" = "clickhouse-keeper-iamguarded container image";
    };
  };
}
