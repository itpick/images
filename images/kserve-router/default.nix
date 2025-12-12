{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# kserve-router
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
  name = "kserve-router";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "kserve-router-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "kserve router";
      "org.opencontainers.image.description" = "kserve-router container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
