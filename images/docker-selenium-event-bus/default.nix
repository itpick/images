{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# docker-selenium-event-bus
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
  name = "docker-selenium-event-bus";
  tag = version;

  copyToRoot = [
    (buildEnv {
      name = "docker-selenium-event-bus-root";
      paths = base.basePackages ++ dockerPkgs ++ [ userEnv ];
    })
  ];

  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv ++ [
      "DOCKER_HOST=unix:///var/run/docker.sock"
    ];
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "docker selenium event uus";
      "org.opencontainers.image.description" = "Docker docker-selenium-event-bus";
      "org.opencontainers.image.version" = version;
    };
  };
}
