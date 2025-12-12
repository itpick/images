{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# akhq
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
  name = "akhq";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "akhq-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "akhq";
      "org.opencontainers.image.description" = "akhq container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
