{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# keycloak-iamguarded
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
  name = "keycloak-iamguarded";
  tag = "latest";
  copyToRoot = [
    (buildEnv {
      name = "keycloak-iamguarded-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "keycloak-iamguarded";
      "org.opencontainers.image.description" = "keycloak-iamguarded container image";
    };
  };
}
