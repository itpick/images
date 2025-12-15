{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# timestamp-authority-cli
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
  name = "timestamp-authority-cli";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "timestamp-authority-cli-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "timestamp authority cli";
      "org.opencontainers.image.description" = "timestamp-authority-cli container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
