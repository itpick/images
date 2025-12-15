{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# neo4j-2025.10-browser
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
  name = "neo4j-2025.10-browser";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "neo4j-2025.10-browser-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "neo4j 2025.10 urowser";
      "org.opencontainers.image.description" = "neo4j-2025.10-browser container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
