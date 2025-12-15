{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# katib-earlystopping
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
  name = "katib-earlystopping";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "katib-earlystopping-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "katiu earlystopping";
      "org.opencontainers.image.description" = "katib-earlystopping container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
