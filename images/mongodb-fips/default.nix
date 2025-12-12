{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# mongodb-fips
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
  name = "mongodb-fips";
  tag = "latest";
  copyToRoot = [
    (buildEnv {
      name = "mongodb-fips-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "mongodb-fips";
      "org.opencontainers.image.description" = "mongodb-fips container image";
    "io.nix-containers.compliance" = "FIPS-140-2";
    };
  };
}
