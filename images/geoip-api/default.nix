{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# geoip-api
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
  name = "geoip-api";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "geoip-api-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "geoip api";
      "org.opencontainers.image.description" = "geoip-api container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
