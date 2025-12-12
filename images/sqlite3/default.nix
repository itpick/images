{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# sqlite3
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
  name = "sqlite3";
  tag = "latest";
  copyToRoot = [
    (buildEnv {
      name = "sqlite3-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "sqlite3";
      "org.opencontainers.image.description" = "sqlite3 container image";
    };
  };
}
