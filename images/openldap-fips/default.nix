{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# openldap-fips
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
  name = "openldap-fips";
  tag = "latest";
  copyToRoot = [
    (buildEnv {
      name = "openldap-fips-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "openldap-fips";
      "org.opencontainers.image.description" = "openldap-fips container image";
    "io.nix-containers.compliance" = "FIPS-140-2";
    };
  };
}
