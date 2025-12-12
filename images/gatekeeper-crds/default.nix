{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# gatekeeper-crds
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
  name = "gatekeeper-crds";
  tag = "latest";
  copyToRoot = [
    (buildEnv {
      name = "gatekeeper-crds-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "gatekeeper-crds";
      "org.opencontainers.image.description" = "gatekeeper-crds container image";
    };
  };
}
