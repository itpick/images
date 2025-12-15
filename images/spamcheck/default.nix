{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# spamcheck
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
  name = "spamcheck";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "spamcheck-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "spamcheck";
      "org.opencontainers.image.description" = "spamcheck container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
