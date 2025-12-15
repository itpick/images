{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# splunk-otel-collector
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
  name = "splunk-otel-collector";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "splunk-otel-collector-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "splunk otel collector";
      "org.opencontainers.image.description" = "splunk-otel-collector container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
