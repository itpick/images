{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# cassandra-reaper
# Container image

let
  version = "latest";
  
  imagePkgs = with pkgs; [
    bash
    coreutils
    cacert
    tzdata
  ];

  userEnv = nonRoot.mkDefaultUserEnv pkgs [];

in nix2container.buildImage {
  name = "cassandra-reaper";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "cassandra-reaper-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "cassandra reaper";
      "org.opencontainers.image.description" = "cassandra-reaper container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
