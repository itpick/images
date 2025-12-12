{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# camunda-keycloak-fips
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
  name = "camunda-keycloak-fips";
  tag = "latest";
  copyToRoot = [
    (buildEnv {
      name = "camunda-keycloak-fips-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "camunda-keycloak-fips";
      "org.opencontainers.image.description" = "camunda-keycloak-fips container image";
    "io.nix-containers.compliance" = "FIPS-140-2";
    };
  };
}
