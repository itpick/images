{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# redis-sentinel-iamguarded
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
  name = "redis-sentinel-iamguarded";
  tag = pkgs.redis.version;
  copyToRoot = [
    (buildEnv {
      name = "redis-sentinel-iamguarded-root";
      paths = base.basePackages ++ redisPkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "redis-sentinel-iamguarded";
      "org.opencontainers.image.description" = "Redis redis-sentinel-iamguarded";
      "org.opencontainers.image.version" = pkgs.redis.version;
      "io.nix-containers.chart" = "redis";
    };
  };
}
