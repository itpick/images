{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# vgpu-util
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
  name = "vgpu-util";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "vgpu-util-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "vgpu util";
      "org.opencontainers.image.description" = "vgpu-util container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
