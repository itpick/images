{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# nvidia-gpu-operator-validator
# NVIDIA component for container/GPU workloads

let
  version = "1.0.0";
  
  nvidiaPkgs = with pkgs; [
    bash
    coreutils
    cacert
  ];

  userEnv = nonRoot.mkDefaultUserEnv pkgs [];

in
nix2container.buildImage {
  name = "nvidia-gpu-operator-validator";
  tag = version;

  copyToRoot = [
    (buildEnv {
      name = "nvidia-gpu-operator-validator-root";
      paths = base.basePackages ++ nvidiaPkgs ++ [ userEnv ];
    })
  ];

  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "nvidia gpu operator validator";
      "org.opencontainers.image.description" = "NVIDIA nvidia-gpu-operator-validator";
      "org.opencontainers.image.version" = version;
    };
  };
}
