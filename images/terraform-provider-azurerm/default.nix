{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# terraform-provider-azurerm
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
  name = "terraform-provider-azurerm";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "terraform-provider-azurerm-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "terraform provider azurerm";
      "org.opencontainers.image.description" = "terraform-provider-azurerm container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
