{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# dataplaneapi
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
  name = "dataplaneapi";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "dataplaneapi-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "dataplaneapi";
      "org.opencontainers.image.description" = "dataplaneapi container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
