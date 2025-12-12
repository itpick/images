{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# dependency-track
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
  name = "dependency-track";
  tag = "latest";
  copyToRoot = [
    (buildEnv {
      name = "dependency-track-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "dependency-track";
      "org.opencontainers.image.description" = "dependency-track container image";
    };
  };
}
