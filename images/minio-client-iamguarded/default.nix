{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# minio-client-iamguarded
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
  name = "minio-client-iamguarded";
  tag = "latest";
  copyToRoot = [
    (buildEnv {
      name = "minio-client-iamguarded-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "minio-client-iamguarded";
      "org.opencontainers.image.description" = "minio-client-iamguarded container image";
    };
  };
}
