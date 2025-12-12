{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# log-counter
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
  name = "log-counter";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "log-counter-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "log counter";
      "org.opencontainers.image.description" = "log-counter container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
