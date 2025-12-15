{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# clamav-1.5-freshclam
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
  name = "clamav-1.5-freshclam";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "clamav-1.5-freshclam-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "clamav 1.5 freshclam";
      "org.opencontainers.image.description" = "clamav-1.5-freshclam container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
