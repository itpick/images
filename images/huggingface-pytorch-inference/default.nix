{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# huggingface-pytorch-inference
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
  name = "huggingface-pytorch-inference";
  tag = "latest";
  copyToRoot = [
    (buildEnv {
      name = "huggingface-pytorch-inference-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "huggingface-pytorch-inference";
      "org.opencontainers.image.description" = "huggingface-pytorch-inference container image";
    };
  };
}
