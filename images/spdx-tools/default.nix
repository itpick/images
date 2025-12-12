{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# spdx-tools
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
  name = "spdx-tools";
  tag = "latest";
  copyToRoot = [
    (buildEnv {
      name = "spdx-tools-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "spdx-tools";
      "org.opencontainers.image.description" = "spdx-tools container image";
    };
  };
}
