{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# gha-runner-scale-set-controller
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
  name = "gha-runner-scale-set-controller";
  tag = "latest";
  copyToRoot = [
    (buildEnv {
      name = "gha-runner-scale-set-controller-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "gha-runner-scale-set-controller";
      "org.opencontainers.image.description" = "gha-runner-scale-set-controller container image";
    };
  };
}
