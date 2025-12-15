{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# containers-common
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
  name = "containers-common";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "containers-common-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "containers common";
      "org.opencontainers.image.description" = "containers-common container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
