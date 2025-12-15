{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# dapr-sentry
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
  name = "dapr-sentry";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "dapr-sentry-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "dapr sentry";
      "org.opencontainers.image.description" = "dapr-sentry container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
