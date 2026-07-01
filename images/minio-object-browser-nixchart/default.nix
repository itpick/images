{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# minio-object-browser-nixchart
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
  name = "minio-object-browser-nixchart";
  tag = "latest";
  copyToRoot = [
    (buildEnv {
      name = "minio-object-browser-nixchart-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "minio-object-browser-nixchart";
      "org.opencontainers.image.description" = "minio-object-browser-nixchart container image";
    };
  };
}
