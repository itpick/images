{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# dcgm
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
  name = "dcgm";
  tag = "latest";
  copyToRoot = [
    (buildEnv {
      name = "dcgm-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "dcgm";
      "org.opencontainers.image.description" = "dcgm container image";
    };
  };
}
