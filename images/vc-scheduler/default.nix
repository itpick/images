{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# vc-scheduler
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
  name = "vc-scheduler";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "vc-scheduler-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "vc scheduler";
      "org.opencontainers.image.description" = "vc-scheduler container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
