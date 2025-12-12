{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# adoptium-openjdk
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
  name = "adoptium-openjdk";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "adoptium-openjdk-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "adoptium openjdk";
      "org.opencontainers.image.description" = "adoptium-openjdk container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
