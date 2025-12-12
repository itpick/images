{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# jmx-exporter-iamguarded
# Container image

let
  imagePkgs = with pkgs; [
    bash
    coreutils
    cacert
    tzdata
  ];

  userEnv = nonRoot.mkDefaultUserEnv pkgs [];

in nix2container.buildImage {
  name = "jmx-exporter-iamguarded";
  tag = "latest";
  copyToRoot = [
    (buildEnv {
      name = "jmx-exporter-iamguarded-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "jmx-exporter-iamguarded";
      "org.opencontainers.image.description" = "jmx-exporter-iamguarded container image";
    };
  };
}
