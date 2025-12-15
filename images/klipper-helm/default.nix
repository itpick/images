{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# klipper-helm
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
  name = "klipper-helm";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "klipper-helm-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "klipper helm";
      "org.opencontainers.image.description" = "klipper-helm container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
