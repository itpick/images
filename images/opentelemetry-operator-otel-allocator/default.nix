{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# opentelemetry-operator-otel-allocator
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
  name = "opentelemetry-operator-otel-allocator";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "opentelemetry-operator-otel-allocator-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "opentelemetry operator otel allocator";
      "org.opencontainers.image.description" = "opentelemetry-operator-otel-allocator container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
