{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# dcgm-exporter-privileged
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
  name = "dcgm-exporter-privileged";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "dcgm-exporter-privileged-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "dcgm exporter privileged";
      "org.opencontainers.image.description" = "dcgm-exporter-privileged container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
