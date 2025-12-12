{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# trino-plugin-exchange-filesystem
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
  name = "trino-plugin-exchange-filesystem";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "trino-plugin-exchange-filesystem-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "trino plugin exchange filesystem";
      "org.opencontainers.image.description" = "trino-plugin-exchange-filesystem container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
