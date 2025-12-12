{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# linkerd-metrics-api
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
  name = "linkerd-metrics-api";
  tag = "latest";
  copyToRoot = [
    (buildEnv {
      name = "linkerd-metrics-api-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "linkerd-metrics-api";
      "org.opencontainers.image.description" = "linkerd-metrics-api container image";
    };
  };
}
