{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# statsd
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
  name = "statsd";
  tag = "latest";
  copyToRoot = [
    (buildEnv {
      name = "statsd-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "statsd";
      "org.opencontainers.image.description" = "statsd container image";
    };
  };
}
