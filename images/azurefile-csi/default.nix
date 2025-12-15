{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# azurefile-csi
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
  name = "azurefile-csi";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "azurefile-csi-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "azurefile csi";
      "org.opencontainers.image.description" = "azurefile-csi container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
