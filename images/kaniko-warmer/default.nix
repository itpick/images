{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# kaniko-warmer
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
  name = "kaniko-warmer";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "kaniko-warmer-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "kaniko warmer";
      "org.opencontainers.image.description" = "kaniko-warmer container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
