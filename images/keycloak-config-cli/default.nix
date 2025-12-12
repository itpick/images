{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# keycloak-config-cli
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
  name = "keycloak-config-cli";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "keycloak-config-cli-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "keycloak config cli";
      "org.opencontainers.image.description" = "keycloak-config-cli container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
