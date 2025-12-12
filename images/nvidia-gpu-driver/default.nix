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
      "org.opencontainers.image.title" = "nvidia-gpu-driver";
      "org.opencontainers.image.description" = "nvidia-gpu-driver container image";
    };
  };
}
