{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# rke2-runtime
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
  name = "rke2-runtime";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "rke2-runtime-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "rke2 runtime";
      "org.opencontainers.image.description" = "rke2-runtime container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
