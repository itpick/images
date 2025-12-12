{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# dcgm-exporter
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
  name = "dcgm-exporter";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "dcgm-exporter-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "dcgm exporter";
      "org.opencontainers.image.description" = "dcgm-exporter container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
