{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# amazon-corretto-jdk
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
  name = "amazon-corretto-jdk";
  tag = "latest";
  copyToRoot = [
    (buildEnv {
      name = "amazon-corretto-jdk-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "binary";
      "io.nix-containers.build-method" = "Pre-built binary packaged with Nix";
      "org.opencontainers.image.title" = "amazon-corretto-jdk";
      "org.opencontainers.image.description" = "amazon-corretto-jdk container image";
    };
  };
}
