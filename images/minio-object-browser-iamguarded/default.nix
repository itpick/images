{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# minio-object-browser-iamguarded
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
  name = "minio-object-browser-iamguarded";
  tag = "latest";
  copyToRoot = [
    (buildEnv {
      name = "minio-object-browser-iamguarded-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "minio-object-browser-iamguarded";
      "org.opencontainers.image.description" = "minio-object-browser-iamguarded container image";
    };
  };
}
