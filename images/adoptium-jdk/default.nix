{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# adoptium-jdk
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
  name = "adoptium-jdk";
  tag = "latest";
  copyToRoot = [
    (buildEnv {
      name = "adoptium-jdk-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "binary";
      "io.nix-containers.build-method" = "Pre-built binary packaged with Nix";
      "org.opencontainers.image.title" = "adoptium-jdk";
      "org.opencontainers.image.description" = "adoptium-jdk container image";
    };
  };
}
