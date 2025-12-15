{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# gstreamer
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
  name = "gstreamer";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "gstreamer-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "gstreamer";
      "org.opencontainers.image.description" = "gstreamer container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
