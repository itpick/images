{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# corretto
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
  name = "corretto";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "corretto-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "corretto";
      "org.opencontainers.image.description" = "corretto container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
