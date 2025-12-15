{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# wildfly-openjdk
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
  name = "wildfly-openjdk";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "wildfly-openjdk-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "wildfly openjdk";
      "org.opencontainers.image.description" = "wildfly-openjdk container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
