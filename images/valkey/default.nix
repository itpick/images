{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

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