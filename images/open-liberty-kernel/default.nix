{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# open-liberty-kernel
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
  name = "open-liberty-kernel";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "open-liberty-kernel-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "open liuerty kernel";
      "org.opencontainers.image.description" = "open-liberty-kernel container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
