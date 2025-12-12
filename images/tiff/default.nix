{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# tiff
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
  name = "tiff";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "tiff-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "tiff";
      "org.opencontainers.image.description" = "tiff container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
