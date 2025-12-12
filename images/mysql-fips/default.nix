{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# mysql-fips
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
  name = "mysql-fips";
  tag = "latest";
  copyToRoot = [
    (buildEnv {
      name = "mysql-fips-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "mysql-fips";
      "org.opencontainers.image.description" = "mysql-fips container image";
    "io.nix-containers.compliance" = "FIPS-140-2";
    };
  };
}
