{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# datadog-security-agent-policies
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
  name = "datadog-security-agent-policies";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "datadog-security-agent-policies-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "datadog security agent policies";
      "org.opencontainers.image.description" = "datadog-security-agent-policies container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
