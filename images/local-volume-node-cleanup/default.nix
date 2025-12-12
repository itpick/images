{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# local-volume-node-cleanup
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
  name = "local-volume-node-cleanup";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "local-volume-node-cleanup-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "local volume node cleanup";
      "org.opencontainers.image.description" = "local-volume-node-cleanup container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
