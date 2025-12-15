{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# go-openssl
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
  name = "go-openssl";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "go-openssl-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "go openssl";
      "org.opencontainers.image.description" = "go-openssl container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
