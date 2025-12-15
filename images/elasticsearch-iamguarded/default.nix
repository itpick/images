{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# elasticsearch-iamguarded
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
  name = "elasticsearch-iamguarded";
  tag = "latest";
  copyToRoot = [
    (buildEnv {
      name = "elasticsearch-iamguarded-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "elasticsearch-iamguarded";
      "org.opencontainers.image.description" = "elasticsearch-iamguarded container image";
    };
  };
}
