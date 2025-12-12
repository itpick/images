{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# grafana-grafonnet
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
  name = "grafana-grafonnet";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "grafana-grafonnet-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "grafana grafonnet";
      "org.opencontainers.image.description" = "grafana-grafonnet container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
