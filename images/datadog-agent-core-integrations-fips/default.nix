{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# datadog-agent-core-integrations-fips
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
  name = "datadog-agent-core-integrations-fips";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "datadog-agent-core-integrations-fips-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "datadog agent core integrations fips";
      "org.opencontainers.image.description" = "datadog-agent-core-integrations-fips container image";
      "org.opencontainers.image.version" = version;
    "io.nix-containers.compliance" = "FIPS-140-2";
    };
  };
}
