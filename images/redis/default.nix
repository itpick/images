{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:


# Chainguard SBOM packages for redis:
# Packages available in nixpkgs:
#   pkgs.bash  # bash (5.3-r3)
#   pkgs.busybox  # busybox (1.37.0-r50)
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.libxcrypt  # libxcrypt (4.5.2-r0)
#   pkgs.ncurses  # ncurses (6.5_p20251025-r1)
#   pkgs.redis  # redis-8.4 (8.4.0-r0)
# Packages NOT in nixpkgs:
#   ld-linux (2.42-r4)
#   libcrypt1 (2.42-r4)
#   libcrypto3 (3.6.0-r4)
#   libssl3 (3.6.0-r4)
#   libstdc++ (15.2.0-r6)
#   ncurses-terminfo-base (6.5_p20251025-r1)
#   posix-libc-utils (2.42-r4)
#   redis-cli-8.4 (8.4.0-r0)

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
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
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