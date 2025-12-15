{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# gdal-py3.13
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
  name = "gdal-py3.13";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "gdal-py3.13-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "gdal py3.13";
      "org.opencontainers.image.description" = "gdal-py3.13 container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
