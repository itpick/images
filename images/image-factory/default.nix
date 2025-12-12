{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# image-factory
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
  name = "image-factory";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "image-factory-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "image factory";
      "org.opencontainers.image.description" = "image-factory container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
