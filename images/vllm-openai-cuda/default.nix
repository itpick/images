{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# vllm-openai-cuda
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
  name = "vllm-openai-cuda";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "vllm-openai-cuda-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "vllm openai cuda";
      "org.opencontainers.image.description" = "vllm-openai-cuda container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
