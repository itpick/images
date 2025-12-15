{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# clamav-1.5-scanner
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
  name = "clamav-1.5-scanner";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "clamav-1.5-scanner-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "clamav 1.5 scanner";
      "org.opencontainers.image.description" = "clamav-1.5-scanner container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
