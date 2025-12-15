{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# vc-webhook-manager
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
  name = "vc-webhook-manager";
  tag = "latest";
  copyToRoot = [
    (buildEnv {
      name = "vc-webhook-manager-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "vc-webhook-manager";
      "org.opencontainers.image.description" = "vc-webhook-manager container image";
    };
  };
}
