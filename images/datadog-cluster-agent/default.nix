{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# datadog-cluster-agent
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
  name = "datadog-cluster-agent";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "datadog-cluster-agent-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "datadog cluster agent";
      "org.opencontainers.image.description" = "datadog-cluster-agent container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
