{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# xfsprogs-core
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
  name = "xfsprogs-core";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "xfsprogs-core-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "xfsprogs core";
      "org.opencontainers.image.description" = "xfsprogs-core container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
