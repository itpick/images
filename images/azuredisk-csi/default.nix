{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# azuredisk-csi
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
  name = "azuredisk-csi";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "azuredisk-csi-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "azuredisk csi";
      "org.opencontainers.image.description" = "azuredisk-csi container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
