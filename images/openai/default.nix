{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# openai
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
  name = "openai";
  tag = "latest";
  copyToRoot = [
    (buildEnv {
      name = "openai-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "openai";
      "org.opencontainers.image.description" = "openai container image";
    };
  };
}
