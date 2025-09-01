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
      "org.opencontainers.image.description" = "Redis key-value store";
    };
  };
}