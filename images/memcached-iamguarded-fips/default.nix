{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# memcached-iamguarded-fips
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
  name = "memcached-iamguarded-fips";
  tag = "latest";
  copyToRoot = [
    (buildEnv {
      name = "memcached-iamguarded-fips-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "memcached-iamguarded-fips";
      "org.opencontainers.image.description" = "memcached-iamguarded-fips container image";
    "io.nix-containers.compliance" = "FIPS-140-2";
    };
  };
}
