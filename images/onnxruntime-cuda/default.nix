{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# onnxruntime-cuda
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
  name = "onnxruntime-cuda";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "onnxruntime-cuda-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "onnxruntime cuda";
      "org.opencontainers.image.description" = "onnxruntime-cuda container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
