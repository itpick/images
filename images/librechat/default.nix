{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# librechat
# Container image

let
  imagePkgs = with pkgs; [
    bash
    coreutils
    cacert
    tzdata
  ];

  userEnv = nonRoot.mkDefaultUserEnv pkgs [];

in nix2container.buildImage {
  name = "librechat";
  tag = "latest";
  copyToRoot = [
    (buildEnv {
      name = "librechat-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "librechat";
      "org.opencontainers.image.description" = "librechat container image";
    };
  };
}
