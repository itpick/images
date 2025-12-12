{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# kiam
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
  name = "kiam";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "kiam-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "kiam";
      "org.opencontainers.image.description" = "kiam container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
