{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# camunda-keycloak
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
  name = "camunda-keycloak";
  tag = "latest";
  copyToRoot = [
    (buildEnv {
      name = "camunda-keycloak-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "camunda-keycloak";
      "org.opencontainers.image.description" = "camunda-keycloak container image";
    };
  };
}
