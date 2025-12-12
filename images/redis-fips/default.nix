{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# redis-fips
# Redis component

let
  redisPkgs = with pkgs; [
    redis
    bash
    coreutils
    cacert
  ];

  userEnv = nonRoot.mkDefaultUserEnv pkgs [];

in nix2container.buildImage {
  name = "redis-fips";
  tag = pkgs.redis.version;
  copyToRoot = [
    (buildEnv {
      name = "redis-fips-root";
      paths = base.basePackages ++ redisPkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "redis-fips";
      "org.opencontainers.image.description" = "Redis redis";
      "org.opencontainers.image.version" = pkgs.redis.version;
      "io.nix-containers.chart" = "redis";
    "io.nix-containers.compliance" = "FIPS-140-2";
    };
  };
}
