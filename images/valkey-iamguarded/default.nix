{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# valkey-iamguarded
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
  name = "valkey-iamguarded";
  tag = "latest";
  copyToRoot = [
    (buildEnv {
      name = "valkey-iamguarded-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "valkey-iamguarded";
      "org.opencontainers.image.description" = "valkey-iamguarded container image";
    };
  };
}
