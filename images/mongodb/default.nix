{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

let
  mongoPackages = with pkgs; [
    mongodb
    bash
    coreutils
  ];

  userEnv = nonRoot.mkDefaultUserEnv pkgs [];

in
nix2container.buildImage {
  name = "mongodb";
  tag = "latest";

  copyToRoot = [
    (buildEnv {
      name = "mongodb-root";
      paths = base.basePackages ++ mongoPackages ++ [ userEnv ];
    })
  ];

  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv ++ [
      "PATH=${lib.makeBinPath mongoPackages}"
    ];
    ExposedPorts = {
      "27017/tcp" = {};
    };
    Labels = base.defaultLabels // {
      "org.opencontainers.image.description" = "MongoDB document database";
    };
  };
}