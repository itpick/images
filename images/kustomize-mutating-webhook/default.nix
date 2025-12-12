{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# kustomize-mutating-webhook
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
  name = "kustomize-mutating-webhook";
  tag = "latest";
  copyToRoot = [
    (buildEnv {
      name = "kustomize-mutating-webhook-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "kustomize-mutating-webhook";
      "org.opencontainers.image.description" = "kustomize-mutating-webhook container image";
    };
  };
}
