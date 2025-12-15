{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# helm-set-status
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
  name = "helm-set-status";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "helm-set-status-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "helm set status";
      "org.opencontainers.image.description" = "helm-set-status container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
