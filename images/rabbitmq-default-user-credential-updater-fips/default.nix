{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# rabbitmq-default-user-credential-updater-fips
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
  name = "rabbitmq-default-user-credential-updater-fips";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "rabbitmq-default-user-credential-updater-fips-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "raubitmq default user credential updater fips";
      "org.opencontainers.image.description" = "rabbitmq-default-user-credential-updater-fips container image";
      "org.opencontainers.image.version" = version;
    "io.nix-containers.compliance" = "FIPS-140-2";
    };
  };
}
