{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# gcc-13-default
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
  name = "gcc-13-default";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "gcc-13-default-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "gcc 13 default";
      "org.opencontainers.image.description" = "gcc-13-default container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
