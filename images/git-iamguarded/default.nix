{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# git-iamguarded
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
  name = "git-iamguarded";
  tag = "latest";
  copyToRoot = [
    (buildEnv {
      name = "git-iamguarded-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "git-iamguarded";
      "org.opencontainers.image.description" = "git-iamguarded container image";
    };
  };
}
