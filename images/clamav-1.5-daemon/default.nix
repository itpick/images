{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# clamav-1.5-daemon
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
  name = "clamav-1.5-daemon";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "clamav-1.5-daemon-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "clamav 1.5 daemon";
      "org.opencontainers.image.description" = "clamav-1.5-daemon container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
