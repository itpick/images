{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# tdbg
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
  name = "tdbg";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "tdbg-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "tdug";
      "org.opencontainers.image.description" = "tdbg container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
