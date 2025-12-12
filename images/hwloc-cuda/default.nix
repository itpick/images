{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# hwloc-cuda
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
  name = "hwloc-cuda";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "hwloc-cuda-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "hwloc cuda";
      "org.opencontainers.image.description" = "hwloc-cuda container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
