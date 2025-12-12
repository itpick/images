{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# neuvector-updater
# Container image

let
  imagePkgs = with pkgs; [
    bash
    coreutils
    cacert
    tzdata
  ];

  userEnv = nonRoot.mkDefaultUserEnv pkgs [];

in nix2container.buildImage {
  name = "neuvector-updater";
  tag = "latest";
  copyToRoot = [
    (buildEnv {
      name = "neuvector-updater-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "neuvector-updater";
      "org.opencontainers.image.description" = "neuvector-updater container image";
    };
  };
}
