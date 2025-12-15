{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# loki-3.6-promtail
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
  name = "loki-3.6-promtail";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "loki-3.6-promtail-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "loki 3.6 promtail";
      "org.opencontainers.image.description" = "loki-3.6-promtail container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
