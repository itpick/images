{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# nvidia-gpu-driver
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
  name = "nvidia-gpu-driver";
  tag = "latest";
  copyToRoot = [
    (buildEnv {
      name = "nvidia-gpu-driver-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "nvidia-gpu-driver";
      "org.opencontainers.image.description" = "nvidia-gpu-driver container image";
    };
  };
}
