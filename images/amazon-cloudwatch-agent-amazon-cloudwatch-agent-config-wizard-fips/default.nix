{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# amazon-cloudwatch-agent-amazon-cloudwatch-agent-config-wizard-fips
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
  name = "amazon-cloudwatch-agent-amazon-cloudwatch-agent-config-wizard-fips";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "amazon-cloudwatch-agent-amazon-cloudwatch-agent-config-wizard-fips-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "amazon cloudwatch agent amazon cloudwatch agent config wizard fips";
      "org.opencontainers.image.description" = "amazon-cloudwatch-agent-amazon-cloudwatch-agent-config-wizard-fips container image";
      "org.opencontainers.image.version" = version;
    "io.nix-containers.compliance" = "FIPS-140-2";
    };
  };
}
