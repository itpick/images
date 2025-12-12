{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# mps-control-daemon
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
  name = "mps-control-daemon";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "mps-control-daemon-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "mps control daemon";
      "org.opencontainers.image.description" = "mps-control-daemon container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
