{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# dex-k8s-authenticator
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
  name = "dex-k8s-authenticator";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "dex-k8s-authenticator-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "dex k8s authenticator";
      "org.opencontainers.image.description" = "dex-k8s-authenticator container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
