{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# corretto-21-default-jdk
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
  name = "corretto-21-default-jdk";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "corretto-21-default-jdk-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "corretto 21 default jdk";
      "org.opencontainers.image.description" = "corretto-21-default-jdk container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
