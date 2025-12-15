{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# nvidia-container-toolkit-nvidia-cdi-hook
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
  name = "nvidia-container-toolkit-nvidia-cdi-hook";
  tag = version;

  copyToRoot = [
    (buildEnv {
      name = "nvidia-container-toolkit-nvidia-cdi-hook-root";
      paths = base.basePackages ++ nvidiaPkgs ++ [ userEnv ];
    })
  ];

  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "nvidia container toolkit nvidia cdi hook";
      "org.opencontainers.image.description" = "NVIDIA nvidia-container-toolkit-nvidia-cdi-hook";
      "org.opencontainers.image.version" = version;
    };
  };
}
