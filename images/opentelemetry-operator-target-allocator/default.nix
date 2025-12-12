{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# opentelemetry-operator-target-allocator
# Container image

let
  imagePkgs = with pkgs; [
    bash
    coreutils
    cacert
    tzdata
  ];

  userEnv = nonRoot.mkDefaultUserEnv pkgs [];

in nix2container.buildImage {
  name = "opentelemetry-operator-target-allocator";
  tag = "latest";
  copyToRoot = [
    (buildEnv {
      name = "opentelemetry-operator-target-allocator-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "opentelemetry-operator-target-allocator";
      "org.opencontainers.image.description" = "opentelemetry-operator-target-allocator container image";
    };
  };
}
