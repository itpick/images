{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# gatekeeper-3.21-crds
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
  name = "gatekeeper-3.21-crds";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "gatekeeper-3.21-crds-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "gatekeeper 3.21 crds";
      "org.opencontainers.image.description" = "gatekeeper-3.21-crds container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
