{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# newrelic-infrastructure-bundle
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
  name = "newrelic-infrastructure-bundle";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "newrelic-infrastructure-bundle-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "newrelic infrastructure uundle";
      "org.opencontainers.image.description" = "newrelic-infrastructure-bundle container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
