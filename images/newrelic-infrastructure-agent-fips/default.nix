{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# newrelic-infrastructure-agent-fips
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
  name = "newrelic-infrastructure-agent-fips";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "newrelic-infrastructure-agent-fips-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "newrelic infrastructure agent fips";
      "org.opencontainers.image.description" = "newrelic-infrastructure-agent-fips container image";
      "org.opencontainers.image.version" = version;
    "io.nix-containers.compliance" = "FIPS-140-2";
    };
  };
}
