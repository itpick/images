{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# docker-selenium-session-queue
# Docker component

let
  version = "27.5.0";
  
  dockerPkgs = with pkgs; [
    docker-client
    bash
    coreutils
    cacert
  ];

  userEnv = nonRoot.mkDefaultUserEnv pkgs [];

in
nix2container.buildImage {
  name = "docker-selenium-session-queue";
  tag = version;

  copyToRoot = [
    (buildEnv {
      name = "docker-selenium-session-queue-root";
      paths = base.basePackages ++ dockerPkgs ++ [ userEnv ];
    })
  ];

  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv ++ [
      "DOCKER_HOST=unix:///var/run/docker.sock"
    ];
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "docker selenium session queue";
      "org.opencontainers.image.description" = "Docker docker-selenium-session-queue";
      "org.opencontainers.image.version" = version;
    };
  };
}
