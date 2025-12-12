{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# findmnt
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
  name = "findmnt";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "findmnt-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "findmnt";
      "org.opencontainers.image.description" = "findmnt container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
