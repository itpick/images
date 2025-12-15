{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# dcgm
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
  name = "dcgm";
  tag = "latest";
  copyToRoot = [
    (buildEnv {
      name = "dcgm-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "dcgm";
      "org.opencontainers.image.description" = "dcgm container image";
    };
  };
}
