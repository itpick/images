{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# icu78-data-full
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
  name = "icu78-data-full";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "icu78-data-full-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "icu78 data full";
      "org.opencontainers.image.description" = "icu78-data-full container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
