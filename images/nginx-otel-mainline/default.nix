{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# nginx-otel-mainline
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
  name = "nginx-otel-mainline";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "nginx-otel-mainline-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "nginx otel mainline";
      "org.opencontainers.image.description" = "nginx-otel-mainline container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
