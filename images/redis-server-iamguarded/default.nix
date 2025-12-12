{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# redis-server-iamguarded
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
  name = "redis-server-iamguarded";
  tag = pkgs.redis.version;
  copyToRoot = [
    (buildEnv {
      name = "redis-server-iamguarded-root";
      paths = base.basePackages ++ redisPkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "redis-server-iamguarded";
      "org.opencontainers.image.description" = "Redis redis-server-iamguarded";
      "org.opencontainers.image.version" = pkgs.redis.version;
      "io.nix-containers.chart" = "redis";
    };
  };
}
