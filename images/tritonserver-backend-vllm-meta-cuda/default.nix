{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# tritonserver-backend-vllm-meta-cuda
# Container image

let
  version = "latest";
  
  imagePkgs = with pkgs; [
    bash
    coreutils
    cacert
    tzdata
  ];

  userEnv = nonRoot.mkDefaultUserEnv pkgs [];

in nix2container.buildImage {
  name = "tritonserver-backend-vllm-meta-cuda";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "tritonserver-backend-vllm-meta-cuda-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "tritonserver uackend vllm meta cuda";
      "org.opencontainers.image.description" = "tritonserver-backend-vllm-meta-cuda container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
