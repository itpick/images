{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# graalvm
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
  name = "graalvm";
  tag = "latest";
  copyToRoot = [
    (buildEnv {
      name = "graalvm-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "graalvm";
      "org.opencontainers.image.description" = "graalvm container image";
    };
  };
}
