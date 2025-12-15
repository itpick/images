{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# mii-tool
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
  name = "mii-tool";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "mii-tool-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "mii tool";
      "org.opencontainers.image.description" = "mii-tool container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
