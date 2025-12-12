{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# contour-iamguarded
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
  name = "contour-iamguarded";
  tag = "latest";
  copyToRoot = [
    (buildEnv {
      name = "contour-iamguarded-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "contour-iamguarded";
      "org.opencontainers.image.description" = "contour-iamguarded container image";
    };
  };
}
