{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# cloud-provider-azure-node-manager
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
  name = "cloud-provider-azure-node-manager";
  tag = "latest";
  copyToRoot = [
    (buildEnv {
      name = "cloud-provider-azure-node-manager-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "cloud-provider-azure-node-manager";
      "org.opencontainers.image.description" = "cloud-provider-azure-node-manager container image";
    };
  };
}
