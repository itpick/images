{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# grype-db
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
  name = "grype-db";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "grype-db-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "grype db";
      "org.opencontainers.image.description" = "grype-db container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
