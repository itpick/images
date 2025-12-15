{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# velero-plugin-for-aws
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
  name = "velero-plugin-for-aws";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "velero-plugin-for-aws-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "velero plugin for aws";
      "org.opencontainers.image.description" = "velero-plugin-for-aws container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
