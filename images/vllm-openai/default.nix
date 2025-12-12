{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# vllm-openai
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
  name = "vllm-openai";
  tag = "latest";
  copyToRoot = [
    (buildEnv {
      name = "vllm-openai-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "vllm-openai";
      "org.opencontainers.image.description" = "vllm-openai container image";
    };
  };
}
