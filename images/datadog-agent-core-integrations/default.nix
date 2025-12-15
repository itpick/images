{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# datadog-agent-core-integrations
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
  name = "datadog-agent-core-integrations";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "datadog-agent-core-integrations-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "datadog agent core integrations";
      "org.opencontainers.image.description" = "datadog-agent-core-integrations container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
