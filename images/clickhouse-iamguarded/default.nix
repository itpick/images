{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# clickhouse-iamguarded
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
  name = "clickhouse-iamguarded";
  tag = "latest";
  copyToRoot = [
    (buildEnv {
      name = "clickhouse-iamguarded-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "clickhouse-iamguarded";
      "org.opencontainers.image.description" = "clickhouse-iamguarded container image";
    };
  };
}
