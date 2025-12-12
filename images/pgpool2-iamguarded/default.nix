{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# pgpool2-iamguarded
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
  name = "pgpool2-iamguarded";
  tag = "latest";
  copyToRoot = [
    (buildEnv {
      name = "pgpool2-iamguarded-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "pgpool2-iamguarded";
      "org.opencontainers.image.description" = "pgpool2-iamguarded container image";
    };
  };
}
