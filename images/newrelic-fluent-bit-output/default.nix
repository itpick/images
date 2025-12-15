{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# newrelic-fluent-bit-output
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
  name = "newrelic-fluent-bit-output";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "newrelic-fluent-bit-output-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "newrelic fluent uit output";
      "org.opencontainers.image.description" = "newrelic-fluent-bit-output container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
