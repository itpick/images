{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# hailo-ai-onnxruntime
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
  name = "hailo-ai-onnxruntime";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "hailo-ai-onnxruntime-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "hailo ai onnxruntime";
      "org.opencontainers.image.description" = "hailo-ai-onnxruntime container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
