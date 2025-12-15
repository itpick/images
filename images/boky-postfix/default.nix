{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# boky-postfix
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
  name = "boky-postfix";
  tag = "latest";
  copyToRoot = [
    (buildEnv {
      name = "boky-postfix-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "boky-postfix";
      "org.opencontainers.image.description" = "boky-postfix container image";
    };
  };
}
