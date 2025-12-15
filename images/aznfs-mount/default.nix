{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# aznfs-mount
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
  name = "aznfs-mount";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "aznfs-mount-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "aznfs mount";
      "org.opencontainers.image.description" = "aznfs-mount container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
