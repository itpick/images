{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# gcc-glibc
# Container image

let
  imagePkgs = with pkgs; [
    bash
    coreutils
    cacert
    tzdata
  ];

  userEnv = nonRoot.mkDefaultUserEnv pkgs [];

in nix2container.buildImage {
  name = "gcc-glibc";
  tag = "latest";
  copyToRoot = [
    (buildEnv {
      name = "gcc-glibc-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "gcc-glibc";
      "org.opencontainers.image.description" = "gcc-glibc container image";
    };
  };
}
