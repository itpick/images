{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# java-cacerts
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
  name = "java-cacerts";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "java-cacerts-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "java cacerts";
      "org.opencontainers.image.description" = "java-cacerts container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
