{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# memcached-fips
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
  name = "memcached-fips";
  tag = "latest";
  copyToRoot = [
    (buildEnv {
      name = "memcached-fips-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "memcached-fips";
      "org.opencontainers.image.description" = "memcached-fips container image";
    "io.nix-containers.compliance" = "FIPS-140-2";
    };
  };
}
