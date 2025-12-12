{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# memcached-exporter-iamguarded
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
  name = "memcached-exporter-iamguarded";
  tag = "latest";
  copyToRoot = [
    (buildEnv {
      name = "memcached-exporter-iamguarded-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "memcached-exporter-iamguarded";
      "org.opencontainers.image.description" = "memcached-exporter-iamguarded container image";
    };
  };
}
