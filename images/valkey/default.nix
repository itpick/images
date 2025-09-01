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
    };
  };
}