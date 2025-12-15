{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# openexr-libilmthread
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
  name = "openexr-libilmthread";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "openexr-libilmthread-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "openexr liuilmthread";
      "org.opencontainers.image.description" = "openexr-libilmthread container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
