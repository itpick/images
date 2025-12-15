{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# cni-plugins-loopback
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
  name = "cni-plugins-loopback";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "cni-plugins-loopback-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "cni plugins loopuack";
      "org.opencontainers.image.description" = "cni-plugins-loopback container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
