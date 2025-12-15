{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# mongo-tools
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
  name = "mongo-tools";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "mongo-tools-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "mongo tools";
      "org.opencontainers.image.description" = "mongo-tools container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
