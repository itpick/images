{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# linkerd2-metrics-api
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
  name = "linkerd2-metrics-api";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "linkerd2-metrics-api-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "linkerd2 metrics api";
      "org.opencontainers.image.description" = "linkerd2-metrics-api container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
