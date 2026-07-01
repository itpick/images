{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# keycloak-config-cli-nixchart
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
  name = "keycloak-config-cli-nixchart";
  tag = "latest";
  copyToRoot = [
    (buildEnv {
      name = "keycloak-config-cli-nixchart-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "keycloak-config-cli-nixchart";
      "org.opencontainers.image.description" = "keycloak-config-cli-nixchart container image";
    };
  };
}
