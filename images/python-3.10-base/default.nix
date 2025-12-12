{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# python-3.10-base
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
  name = "python-3.10-base";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "python-3.10-base-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "python 3.10 uase";
      "org.opencontainers.image.description" = "python-3.10-base container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
