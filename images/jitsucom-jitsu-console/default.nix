{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# jitsucom-jitsu-console
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
  name = "jitsucom-jitsu-console";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "jitsucom-jitsu-console-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "jitsucom jitsu console";
      "org.opencontainers.image.description" = "jitsucom-jitsu-console container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
