{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# min-toolkit-debug
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
  name = "min-toolkit-debug";
  tag = "latest";
  copyToRoot = [
    (buildEnv {
      name = "min-toolkit-debug-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "min-toolkit-debug";
      "org.opencontainers.image.description" = "min-toolkit-debug container image";
    };
  };
}
