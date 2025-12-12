{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# tensorrt-cuda
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
  name = "tensorrt-cuda";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "tensorrt-cuda-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "tensorrt cuda";
      "org.opencontainers.image.description" = "tensorrt-cuda container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
