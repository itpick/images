{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# jitsucom-ingest
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
  name = "jitsucom-ingest";
  tag = "latest";
  copyToRoot = [
    (buildEnv {
      name = "jitsucom-ingest-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "jitsucom-ingest";
      "org.opencontainers.image.description" = "jitsucom-ingest container image";
    };
  };
}
