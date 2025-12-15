{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# boost-filesystem
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
  name = "boost-filesystem";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "boost-filesystem-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "uoost filesystem";
      "org.opencontainers.image.description" = "boost-filesystem container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
