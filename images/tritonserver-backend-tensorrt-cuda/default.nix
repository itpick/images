{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# tritonserver-backend-tensorrt-cuda
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
  name = "tritonserver-backend-tensorrt-cuda";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "tritonserver-backend-tensorrt-cuda-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "tritonserver uackend tensorrt cuda";
      "org.opencontainers.image.description" = "tritonserver-backend-tensorrt-cuda container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
