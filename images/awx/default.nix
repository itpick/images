{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# awx
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
  name = "awx";
  tag = "latest";
  copyToRoot = [
    (buildEnv {
      name = "awx-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "awx";
      "org.opencontainers.image.description" = "awx container image";
    };
  };
}
