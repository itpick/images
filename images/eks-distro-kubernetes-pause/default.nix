{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# eks-distro-kubernetes-pause
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
  name = "eks-distro-kubernetes-pause";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "eks-distro-kubernetes-pause-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "eks distro kuuernetes pause";
      "org.opencontainers.image.description" = "eks-distro-kubernetes-pause container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
