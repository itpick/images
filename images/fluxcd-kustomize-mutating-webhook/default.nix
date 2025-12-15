{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# fluxcd-kustomize-mutating-webhook
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
  name = "fluxcd-kustomize-mutating-webhook";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "fluxcd-kustomize-mutating-webhook-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "fluxcd kustomize mutating weuhook";
      "org.opencontainers.image.description" = "fluxcd-kustomize-mutating-webhook container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
