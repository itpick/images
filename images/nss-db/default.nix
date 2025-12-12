{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# nss-db
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
  name = "nss-db";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "nss-db-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "nss db";
      "org.opencontainers.image.description" = "nss-db container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
