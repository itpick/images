{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# grafana-alloy-operator
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
  name = "grafana-alloy-operator";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "grafana-alloy-operator-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "grafana alloy operator";
      "org.opencontainers.image.description" = "grafana-alloy-operator container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
