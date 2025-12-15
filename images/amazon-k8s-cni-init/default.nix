{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# amazon-k8s-cni-init
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
  name = "amazon-k8s-cni-init";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "amazon-k8s-cni-init-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "amazon k8s cni init";
      "org.opencontainers.image.description" = "amazon-k8s-cni-init container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
