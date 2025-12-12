{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# redis-iamguarded
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
  name = "redis-iamguarded";
  tag = pkgs.redis.version;
  copyToRoot = [
    (buildEnv {
      name = "redis-iamguarded-root";
      paths = base.basePackages ++ redisPkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "redis-iamguarded";
      "org.opencontainers.image.description" = "Redis redis-iamguarded";
      "org.opencontainers.image.version" = pkgs.redis.version;
      "io.nix-containers.chart" = "redis";
    };
  };
}
