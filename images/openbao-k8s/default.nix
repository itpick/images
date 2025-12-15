{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# openbao-k8s
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
  name = "openbao-k8s";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "openbao-k8s-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "openuao k8s";
      "org.opencontainers.image.description" = "openbao-k8s container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
