{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# openpmix
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
  name = "openpmix";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "openpmix-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "openpmix";
      "org.opencontainers.image.description" = "openpmix container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
