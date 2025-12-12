{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# nova
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
  name = "nova";
  tag = "latest";
  copyToRoot = [
    (buildEnv {
      name = "nova-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "nova";
      "org.opencontainers.image.description" = "nova container image";
    };
  };
}
