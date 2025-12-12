{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# pgvector
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
  name = "pgvector";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "pgvector-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "pgvector";
      "org.opencontainers.image.description" = "pgvector container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
