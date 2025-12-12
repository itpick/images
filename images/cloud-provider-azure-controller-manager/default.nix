{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# cloud-provider-azure-controller-manager
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
  name = "cloud-provider-azure-controller-manager";
  tag = "latest";
  copyToRoot = [
    (buildEnv {
      name = "cloud-provider-azure-controller-manager-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "cloud-provider-azure-controller-manager";
      "org.opencontainers.image.description" = "cloud-provider-azure-controller-manager container image";
    };
  };
}
