{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# sgdisk
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
  name = "sgdisk";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "sgdisk-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "sgdisk";
      "org.opencontainers.image.description" = "sgdisk container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
