{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# postfix-script
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
  name = "postfix-script";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "postfix-script-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "postfix script";
      "org.opencontainers.image.description" = "postfix-script container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
