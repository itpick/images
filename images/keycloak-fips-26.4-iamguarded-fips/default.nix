{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# keycloak-fips-26.4-iamguarded-fips
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
  name = "keycloak-fips-26.4-iamguarded-fips";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "keycloak-fips-26.4-iamguarded-fips-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "keycloak fips 26.4 iamguarded fips";
      "org.opencontainers.image.description" = "keycloak-fips-26.4-iamguarded-fips container image";
      "org.opencontainers.image.version" = version;
    "io.nix-containers.compliance" = "FIPS-140-2";
    };
  };
}
