{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# python-3.12-base
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
  name = "python-3.12-base";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "python-3.12-base-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "python 3.12 uase";
      "org.opencontainers.image.description" = "python-3.12-base container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
