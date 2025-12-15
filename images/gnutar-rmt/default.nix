{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# gnutar-rmt
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
  name = "gnutar-rmt";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "gnutar-rmt-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "gnutar rmt";
      "org.opencontainers.image.description" = "gnutar-rmt container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
