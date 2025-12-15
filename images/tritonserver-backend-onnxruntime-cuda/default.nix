{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# tritonserver-backend-onnxruntime-cuda
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
  name = "tritonserver-backend-onnxruntime-cuda";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "tritonserver-backend-onnxruntime-cuda-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "tritonserver uackend onnxruntime cuda";
      "org.opencontainers.image.description" = "tritonserver-backend-onnxruntime-cuda container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
