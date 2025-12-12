{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# postgis
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
  name = "postgis";
  tag = "latest";
  copyToRoot = [
    (buildEnv {
      name = "postgis-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "postgis";
      "org.opencontainers.image.description" = "postgis container image";
    };
  };
}
