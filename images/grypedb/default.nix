{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# grypedb
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
  name = "grypedb";
  tag = "latest";
  copyToRoot = [
    (buildEnv {
      name = "grypedb-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "grypedb";
      "org.opencontainers.image.description" = "grypedb container image";
    };
  };
}
