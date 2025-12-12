{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# nvidia-container-toolkit-nvidia-container-runtime-legacy
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
  name = "nvidia-container-toolkit-nvidia-container-runtime-legacy";
  tag = version;

  copyToRoot = [
    (buildEnv {
      name = "nvidia-container-toolkit-nvidia-container-runtime-legacy-root";
      paths = base.basePackages ++ nvidiaPkgs ++ [ userEnv ];
    })
  ];

  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "nvidia container toolkit nvidia container runtime legacy";
      "org.opencontainers.image.description" = "NVIDIA nvidia-container-toolkit-nvidia-container-runtime-legacy";
      "org.opencontainers.image.version" = version;
    };
  };
}
