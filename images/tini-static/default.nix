{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# tini-static
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
  name = "tini-static";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "tini-static-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "tini static";
      "org.opencontainers.image.description" = "tini-static container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
