{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# thanos-iamguarded
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
  name = "thanos-iamguarded";
  tag = "latest";
  copyToRoot = [
    (buildEnv {
      name = "thanos-iamguarded-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "thanos-iamguarded";
      "org.opencontainers.image.description" = "thanos-iamguarded container image";
    };
  };
}
