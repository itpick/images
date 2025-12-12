{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# timestamp-authority-server
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
  name = "timestamp-authority-server";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "timestamp-authority-server-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "timestamp authority server";
      "org.opencontainers.image.description" = "timestamp-authority-server container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
