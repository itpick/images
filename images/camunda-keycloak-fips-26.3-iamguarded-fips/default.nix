{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# camunda-keycloak-fips-26.3-iamguarded-fips
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
  name = "camunda-keycloak-fips-26.3-iamguarded-fips";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "camunda-keycloak-fips-26.3-iamguarded-fips-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "camunda keycloak fips 26.3 iamguarded fips";
      "org.opencontainers.image.description" = "camunda-keycloak-fips-26.3-iamguarded-fips container image";
      "org.opencontainers.image.version" = version;
    "io.nix-containers.compliance" = "FIPS-140-2";
    };
  };
}
