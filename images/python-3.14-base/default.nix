{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# python-3.14-base
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
  name = "python-3.14-base";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "python-3.14-base-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "python 3.14 uase";
      "org.opencontainers.image.description" = "python-3.14-base container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
