{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

let
  redisPackages = with pkgs; [
    redis
    bash
    coreutils
  ];

  userEnv = nonRoot.mkDefaultUserEnv pkgs [];

in
nix2container.buildImage {
  name = "redis";
  tag = "latest";

  copyToRoot = [
    (buildEnv {
      name = "redis-root";
      paths = base.basePackages ++ redisPackages ++ [ userEnv ];
    })
  ];

  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv ++ [
      "PATH=${lib.makeBinPath redisPackages}"
    ];
    ExposedPorts = {
      "6379/tcp" = {};
    };
    Labels = base.defaultLabels // {
      "org.opencontainers.image.description" = "Redis in-memory data structure store";
      "org.opencontainers.image.url" = "https://github.com/nix-containers/images";
      "org.opencontainers.image.source" = "https://github.com/nix-containers/images";
      "org.opencontainers.image.vendor" = "nix-containers";
      "org.opencontainers.image.version" = pkgs.redis.version;
      "io.nix-containers.image.upstream" = "https://redis.io/";
      "io.nix-containers.image.category" = "database";
      "io.nix-containers.image.aliases" = "redis,cache,key-value";
    };
  };
}