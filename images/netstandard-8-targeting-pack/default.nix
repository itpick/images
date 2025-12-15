{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# netstandard-8-targeting-pack
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
  name = "netstandard-8-targeting-pack";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "netstandard-8-targeting-pack-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "netstandard 8 targeting pack";
      "org.opencontainers.image.description" = "netstandard-8-targeting-pack container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
