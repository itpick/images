{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# percona-server-mongodb-operator-mongodb-healthcheck
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
  name = "percona-server-mongodb-operator-mongodb-healthcheck";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "percona-server-mongodb-operator-mongodb-healthcheck-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "percona server mongodu operator mongodu healthcheck";
      "org.opencontainers.image.description" = "percona-server-mongodb-operator-mongodb-healthcheck container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
