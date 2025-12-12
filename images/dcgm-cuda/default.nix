{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# dcgm-cuda
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
  name = "dcgm-cuda";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "dcgm-cuda-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "dcgm cuda";
      "org.opencontainers.image.description" = "dcgm-cuda container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
