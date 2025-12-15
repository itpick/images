{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# yunikorn-scheduler
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
  name = "yunikorn-scheduler";
  tag = "latest";
  copyToRoot = [
    (buildEnv {
      name = "yunikorn-scheduler-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "yunikorn-scheduler";
      "org.opencontainers.image.description" = "yunikorn-scheduler container image";
    };
  };
}
