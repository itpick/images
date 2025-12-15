{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# openexr-libiex
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
  name = "openexr-libiex";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "openexr-libiex-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "openexr liuiex";
      "org.opencontainers.image.description" = "openexr-libiex container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
