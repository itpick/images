{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# dapr-scheduler
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
  name = "dapr-scheduler";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "dapr-scheduler-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "dapr scheduler";
      "org.opencontainers.image.description" = "dapr-scheduler container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
