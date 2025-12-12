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
      "org.opencontainers.image.title" = "dapr sentry";
      "org.opencontainers.image.description" = "dapr-sentry container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
