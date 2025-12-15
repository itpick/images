{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# qt6-qtbase
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
  name = "qt6-qtbase";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "qt6-qtbase-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "qt6 qtuase";
      "org.opencontainers.image.description" = "qt6-qtbase container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
