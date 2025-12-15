{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:


# Chainguard SBOM packages for valkey:
# Packages available in nixpkgs:
#   pkgs.bash  # bash (5.3-r3)
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.ncurses  # ncurses (6.5_p20251025-r1)
#   pkgs.valkey  # valkey-9.0 (9.0.0-r0)
# Packages NOT in nixpkgs:
#   ld-linux (2.42-r4)
#   libcrypto3 (3.6.0-r4)
#   libssl3 (3.6.0-r4)
#   ncurses-terminfo-base (6.5_p20251025-r1)
#   posix-libc-utils (2.42-r4)
#   valkey-9.0-cli (9.0.0-r0)

let
  valkeyPackages = with pkgs; [
    valkey
    bash
    coreutils
  ];

  userEnv = nonRoot.mkDefaultUserEnv pkgs [];

in
nix2container.buildImage {
  name = "valkey";
  tag = "latest";

  copyToRoot = [
    (buildEnv {
      name = "valkey-root";
      paths = base.basePackages ++ valkeyPackages ++ [ userEnv ];
    })
  ];

  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv ++ [
      "PATH=${lib.makeBinPath valkeyPackages}"
    ];
    ExposedPorts = {
      "6379/tcp" = {};
    };
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.description" = "High-performance data structure server (Redis fork)";
      "org.opencontainers.image.url" = "https://github.com/nix-containers/images";
      "org.opencontainers.image.source" = "https://github.com/nix-containers/images";
      "org.opencontainers.image.vendor" = "nix-containers";
      "org.opencontainers.image.version" = pkgs.valkey.version;
      "io.nix-containers.image.upstream" = "https://valkey.io/";
      "io.nix-containers.image.category" = "database";
      "io.nix-containers.image.aliases" = "valkey,cache,key-value,redis";
    };
  };
}