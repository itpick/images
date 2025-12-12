{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# adoptium-openjdk-25-jre-base
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
  name = "adoptium-openjdk-25-jre-base";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "adoptium-openjdk-25-jre-base-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "adoptium openjdk 25 jre uase";
      "org.opencontainers.image.description" = "adoptium-openjdk-25-jre-base container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
