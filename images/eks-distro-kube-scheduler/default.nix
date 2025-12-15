{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# eks-distro-kube-scheduler
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
  name = "eks-distro-kube-scheduler";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "eks-distro-kube-scheduler-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "eks distro kuue scheduler";
      "org.opencontainers.image.description" = "eks-distro-kube-scheduler container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
