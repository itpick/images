{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# hdf5-hl
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
  name = "hdf5-hl";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "hdf5-hl-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "hdf5 hl";
      "org.opencontainers.image.description" = "hdf5-hl container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
