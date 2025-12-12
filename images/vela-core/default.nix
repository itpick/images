{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# vela-core
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
  name = "vela-core";
  tag = "latest";
  copyToRoot = [
    (buildEnv {
      name = "vela-core-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "vela-core";
      "org.opencontainers.image.description" = "vela-core container image";
    };
  };
}
