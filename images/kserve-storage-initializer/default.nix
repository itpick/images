{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# kserve-storage-initializer
# Container image

let
  imagePkgs = with pkgs; [
    bash
    coreutils
    cacert
    tzdata
  ];

  userEnv = nonRoot.mkDefaultUserEnv pkgs [];

in nix2container.buildImage {
  name = "kserve-storage-initializer";
  tag = "latest";
  copyToRoot = [
    (buildEnv {
      name = "kserve-storage-initializer-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "kserve-storage-initializer";
      "org.opencontainers.image.description" = "kserve-storage-initializer container image";
    };
  };
}
