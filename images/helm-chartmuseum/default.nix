{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# helm-chartmuseum
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
  name = "helm-chartmuseum";
  tag = "latest";
  copyToRoot = [
    (buildEnv {
      name = "helm-chartmuseum-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "helm-chartmuseum";
      "org.opencontainers.image.description" = "helm-chartmuseum container image";
    };
  };
}
