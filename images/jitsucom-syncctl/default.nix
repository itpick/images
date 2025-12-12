{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# jitsucom-syncctl
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
  name = "jitsucom-syncctl";
  tag = "latest";
  copyToRoot = [
    (buildEnv {
      name = "jitsucom-syncctl-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "jitsucom-syncctl";
      "org.opencontainers.image.description" = "jitsucom-syncctl container image";
    };
  };
}
