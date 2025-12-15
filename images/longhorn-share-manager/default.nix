{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# longhorn-share-manager
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
  name = "longhorn-share-manager";
  tag = "latest";
  copyToRoot = [
    (buildEnv {
      name = "longhorn-share-manager-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "longhorn-share-manager";
      "org.opencontainers.image.description" = "longhorn-share-manager container image";
    };
  };
}
