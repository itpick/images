{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# keycloak-config-cli-iamguarded
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
  name = "keycloak-config-cli-iamguarded";
  tag = "latest";
  copyToRoot = [
    (buildEnv {
      name = "keycloak-config-cli-iamguarded-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "keycloak-config-cli-iamguarded";
      "org.opencontainers.image.description" = "keycloak-config-cli-iamguarded container image";
    };
  };
}
