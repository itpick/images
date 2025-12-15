{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# opencost-ui
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
  name = "opencost-ui";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "opencost-ui-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "opencost ui";
      "org.opencontainers.image.description" = "opencost-ui container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
