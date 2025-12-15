{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# vela-cli
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
  name = "vela-cli";
  tag = "latest";
  copyToRoot = [
    (buildEnv {
      name = "vela-cli-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "vela-cli";
      "org.opencontainers.image.description" = "vela-cli container image";
    };
  };
}
