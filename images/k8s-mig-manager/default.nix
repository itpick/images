{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# k8s-mig-manager
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
  name = "k8s-mig-manager";
  tag = "latest";
  copyToRoot = [
    (buildEnv {
      name = "k8s-mig-manager-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "k8s-mig-manager";
      "org.opencontainers.image.description" = "k8s-mig-manager container image";
    };
  };
}
