{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# opentelemetry-java-instrumentation
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
  name = "opentelemetry-java-instrumentation";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "opentelemetry-java-instrumentation-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "opentelemetry java instrumentation";
      "org.opencontainers.image.description" = "opentelemetry-java-instrumentation container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
