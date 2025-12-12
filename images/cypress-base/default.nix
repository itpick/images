{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# cypress-base
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
  name = "cypress-base";
  tag = "latest";
  copyToRoot = [
    (buildEnv {
      name = "cypress-base-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "cypress-base";
      "org.opencontainers.image.description" = "cypress-base container image";
    };
  };
}
