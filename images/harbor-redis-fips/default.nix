{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# harbor-redis-fips
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
  name = "harbor-redis-fips";
  tag = "latest";
  copyToRoot = [
    (buildEnv {
      name = "harbor-redis-fips-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "harbor-redis-fips";
      "org.opencontainers.image.description" = "harbor-redis-fips container image";
    "io.nix-containers.compliance" = "FIPS-140-2";
    };
  };
}
