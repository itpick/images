{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# nginx-s3-gateway-unprivileged
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
  name = "nginx-s3-gateway-unprivileged";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "nginx-s3-gateway-unprivileged-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "nginx s3 gateway unprivileged";
      "org.opencontainers.image.description" = "nginx-s3-gateway-unprivileged container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
