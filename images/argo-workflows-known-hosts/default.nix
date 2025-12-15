{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# argo-workflows-known-hosts
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
  name = "argo-workflows-known-hosts";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "argo-workflows-known-hosts-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "argo workflows known hosts";
      "org.opencontainers.image.description" = "argo-workflows-known-hosts container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
