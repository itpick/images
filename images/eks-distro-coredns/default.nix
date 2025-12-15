{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# eks-distro-coredns
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
  name = "eks-distro-coredns";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "eks-distro-coredns-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "eks distro coredns";
      "org.opencontainers.image.description" = "eks-distro-coredns container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
