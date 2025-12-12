{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# huggingface-pytorch-inference-cuda
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
  name = "huggingface-pytorch-inference-cuda";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "huggingface-pytorch-inference-cuda-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "huggingface pytorch inference cuda";
      "org.opencontainers.image.description" = "huggingface-pytorch-inference-cuda container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
