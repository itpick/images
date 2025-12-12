{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# rke2-runtime-airgap
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
  name = "rke2-runtime-airgap";
  tag = "latest";
  copyToRoot = [
    (buildEnv {
      name = "rke2-runtime-airgap-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "rke2-runtime-airgap";
      "org.opencontainers.image.description" = "rke2-runtime-airgap container image";
    };
  };
}
