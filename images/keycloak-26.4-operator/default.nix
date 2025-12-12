{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# keycloak-26.4-operator
# Container image

let
  version = "latest";
  
  imagePkgs = with pkgs; [
    bash
    coreutils
    cacert
    tzdata
  ];

  userEnv = nonRoot.mkDefaultUserEnv pkgs [];

in nix2container.buildImage {
  name = "keycloak-26.4-operator";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "keycloak-26.4-operator-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "keycloak 26.4 operator";
      "org.opencontainers.image.description" = "keycloak-26.4-operator container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
