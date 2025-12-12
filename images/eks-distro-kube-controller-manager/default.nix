{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# eks-distro-kube-controller-manager
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
  name = "eks-distro-kube-controller-manager";
  tag = "latest";
  copyToRoot = [
    (buildEnv {
      name = "eks-distro-kube-controller-manager-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "eks-distro-kube-controller-manager";
      "org.opencontainers.image.description" = "eks-distro-kube-controller-manager container image";
    };
  };
}
