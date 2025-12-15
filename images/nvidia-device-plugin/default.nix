{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# nvidia-device-plugin
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
  name = "nvidia-device-plugin";
  tag = version;

  copyToRoot = [
    (buildEnv {
      name = "nvidia-device-plugin-root";
      paths = base.basePackages ++ nvidiaPkgs ++ [ userEnv ];
    })
  ];

  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "nvidia device plugin";
      "org.opencontainers.image.description" = "NVIDIA nvidia-device-plugin";
      "org.opencontainers.image.version" = version;
    };
  };
}
