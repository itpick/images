{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# vc-controller-manager
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
  name = "vc-controller-manager";
  tag = "latest";
  copyToRoot = [
    (buildEnv {
      name = "vc-controller-manager-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "vc-controller-manager";
      "org.opencontainers.image.description" = "vc-controller-manager container image";
    };
  };
}
