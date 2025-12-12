{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# pgaudit
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
  name = "pgaudit";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "pgaudit-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "pgaudit";
      "org.opencontainers.image.description" = "pgaudit container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
