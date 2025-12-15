{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# ratify-crds
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
  name = "ratify-crds";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "ratify-crds-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "ratify crds";
      "org.opencontainers.image.description" = "ratify-crds container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
