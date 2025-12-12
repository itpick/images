{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# mysql-client
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
  name = "mysql-client";
  tag = "latest";
  copyToRoot = [
    (buildEnv {
      name = "mysql-client-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "mysql-client";
      "org.opencontainers.image.description" = "mysql-client container image";
    };
  };
}
