{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# efs-utils
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
  name = "efs-utils";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "efs-utils-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "efs utils";
      "org.opencontainers.image.description" = "efs-utils container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
