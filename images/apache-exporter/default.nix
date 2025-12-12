{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# apache-exporter
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
  name = "apache-exporter";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "apache-exporter-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "apache exporter";
      "org.opencontainers.image.description" = "apache-exporter container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
