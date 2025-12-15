{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# barman-cloudnative-pg
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
  name = "barman-cloudnative-pg";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "barman-cloudnative-pg-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "uarman cloudnative pg";
      "org.opencontainers.image.description" = "barman-cloudnative-pg container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
