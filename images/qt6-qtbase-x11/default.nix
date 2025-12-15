{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# qt6-qtbase-x11
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
  name = "qt6-qtbase-x11";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "qt6-qtbase-x11-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "qt6 qtuase x11";
      "org.opencontainers.image.description" = "qt6-qtbase-x11 container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
