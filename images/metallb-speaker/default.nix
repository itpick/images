{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# metallb-speaker
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
  name = "metallb-speaker";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "metallb-speaker-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "metallu speaker";
      "org.opencontainers.image.description" = "metallb-speaker container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
