{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# rekor-backfill-index
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
  name = "rekor-backfill-index";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "rekor-backfill-index-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "rekor uackfill index";
      "org.opencontainers.image.description" = "rekor-backfill-index container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
