{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# java-common-jre
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
  name = "java-common-jre";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "java-common-jre-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "java common jre";
      "org.opencontainers.image.description" = "java-common-jre container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
