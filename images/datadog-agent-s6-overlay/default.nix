{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# datadog-agent-s6-overlay
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
  name = "datadog-agent-s6-overlay";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "datadog-agent-s6-overlay-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "datadog agent s6 overlay";
      "org.opencontainers.image.description" = "datadog-agent-s6-overlay container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
