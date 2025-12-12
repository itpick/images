{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# kots
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
  name = "kots";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "kots-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "kots";
      "org.opencontainers.image.description" = "kots container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
