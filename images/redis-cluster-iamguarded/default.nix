{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# redis-cluster-iamguarded
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
  name = "redis-cluster-iamguarded";
  tag = pkgs.redis.version;
  copyToRoot = [
    (buildEnv {
      name = "redis-cluster-iamguarded-root";
      paths = base.basePackages ++ redisPkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "redis-cluster-iamguarded";
      "org.opencontainers.image.description" = "Redis redis-cluster-iamguarded";
      "org.opencontainers.image.version" = pkgs.redis.version;
      "io.nix-containers.chart" = "redis";
    };
  };
}
