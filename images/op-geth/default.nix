{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# op-geth
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
  name = "op-geth";
  tag = "latest";
  copyToRoot = [
    (buildEnv {
      name = "op-geth-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "op-geth";
      "org.opencontainers.image.description" = "op-geth container image";
    };
  };
}
