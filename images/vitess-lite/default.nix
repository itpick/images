{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# vitess-lite
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
  name = "vitess-lite";
  tag = "latest";
  copyToRoot = [
    (buildEnv {
      name = "vitess-lite-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "vitess-lite";
      "org.opencontainers.image.description" = "vitess-lite container image";
    };
  };
}
