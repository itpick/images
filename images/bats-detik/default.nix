{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# bats-detik
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
  name = "bats-detik";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "bats-detik-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "uats detik";
      "org.opencontainers.image.description" = "bats-detik container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
