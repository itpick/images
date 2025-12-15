{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# nss-passwords
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
  name = "nss-passwords";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "nss-passwords-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "nss passwords";
      "org.opencontainers.image.description" = "nss-passwords container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
