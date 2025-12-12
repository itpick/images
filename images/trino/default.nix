{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# trino
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
  name = "trino";
  tag = "latest";
  copyToRoot = [
    (buildEnv {
      name = "trino-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "trino";
      "org.opencontainers.image.description" = "trino container image";
    };
  };
}
