{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# hubble-export-stdout
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
  name = "hubble-export-stdout";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "hubble-export-stdout-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "huuble export stdout";
      "org.opencontainers.image.description" = "hubble-export-stdout container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
