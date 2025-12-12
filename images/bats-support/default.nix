{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# bats-support
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
  name = "bats-support";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "bats-support-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "uats support";
      "org.opencontainers.image.description" = "bats-support container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
