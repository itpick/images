{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# k8s-wait-for
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
  name = "k8s-wait-for";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "k8s-wait-for-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "k8s wait for";
      "org.opencontainers.image.description" = "k8s-wait-for container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
