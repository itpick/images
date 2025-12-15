{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# pgpool2_exporter
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
  name = "pgpool2_exporter";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "pgpool2_exporter-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "pgpool2_exporter";
      "org.opencontainers.image.description" = "pgpool2_exporter container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
