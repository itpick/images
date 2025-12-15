{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# cloudwatch-exporter
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
  name = "cloudwatch-exporter";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "cloudwatch-exporter-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "cloudwatch exporter";
      "org.opencontainers.image.description" = "cloudwatch-exporter container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
