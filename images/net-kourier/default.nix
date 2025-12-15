{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# net-kourier
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
  name = "net-kourier";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "net-kourier-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "net kourier";
      "org.opencontainers.image.description" = "net-kourier container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
