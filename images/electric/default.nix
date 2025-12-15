{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# electric
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
  name = "electric";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "electric-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "electric";
      "org.opencontainers.image.description" = "electric container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
