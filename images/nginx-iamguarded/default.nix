{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# nginx-iamguarded
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
  name = "nginx-iamguarded";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "nginx-iamguarded-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "nginx iamguarded";
      "org.opencontainers.image.description" = "nginx-iamguarded container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
