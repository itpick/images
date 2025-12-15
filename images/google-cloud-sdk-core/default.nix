{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# google-cloud-sdk-core
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
  name = "google-cloud-sdk-core";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "google-cloud-sdk-core-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "google cloud sdk core";
      "org.opencontainers.image.description" = "google-cloud-sdk-core container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
