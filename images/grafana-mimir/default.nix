{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# grafana-mimir
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
  name = "grafana-mimir";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "grafana-mimir-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "grafana mimir";
      "org.opencontainers.image.description" = "grafana-mimir container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
