{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# trino-plugin-tpcds
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
  name = "trino-plugin-tpcds";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "trino-plugin-tpcds-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "trino plugin tpcds";
      "org.opencontainers.image.description" = "trino-plugin-tpcds container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
