{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# pgwatch
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
  name = "pgwatch";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "pgwatch-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "pgwatch";
      "org.opencontainers.image.description" = "pgwatch container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
