{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# mysql-8.4-client
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
  name = "mysql-8.4-client";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "mysql-8.4-client-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "mysql 8.4 client";
      "org.opencontainers.image.description" = "mysql-8.4-client container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
