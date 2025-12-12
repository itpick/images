{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# keycloak-operator
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
  name = "keycloak-operator";
  tag = "latest";
  copyToRoot = [
    (buildEnv {
      name = "keycloak-operator-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "keycloak-operator";
      "org.opencontainers.image.description" = "keycloak-operator container image";
    };
  };
}
