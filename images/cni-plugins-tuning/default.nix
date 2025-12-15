{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# cni-plugins-tuning
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
  name = "cni-plugins-tuning";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "cni-plugins-tuning-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "cni plugins tuning";
      "org.opencontainers.image.description" = "cni-plugins-tuning container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
