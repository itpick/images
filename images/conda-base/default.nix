{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# conda-base
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
  name = "conda-base";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "conda-base-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "conda uase";
      "org.opencontainers.image.description" = "conda-base container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
