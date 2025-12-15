{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# timestamp-authority
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
  name = "timestamp-authority";
  tag = "latest";
  copyToRoot = [
    (buildEnv {
      name = "timestamp-authority-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "timestamp-authority";
      "org.opencontainers.image.description" = "timestamp-authority container image";
    };
  };
}
