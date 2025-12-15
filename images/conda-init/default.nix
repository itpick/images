{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# conda-init
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
  name = "conda-init";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "conda-init-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "conda init";
      "org.opencontainers.image.description" = "conda-init container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
