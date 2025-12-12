{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# memcached-iamguarded
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
  name = "memcached-iamguarded";
  tag = "latest";
  copyToRoot = [
    (buildEnv {
      name = "memcached-iamguarded-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "memcached-iamguarded";
      "org.opencontainers.image.description" = "memcached-iamguarded container image";
    };
  };
}
