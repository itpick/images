{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# nist-esv
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
  name = "nist-esv";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "nist-esv-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "nist esv";
      "org.opencontainers.image.description" = "nist-esv container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
