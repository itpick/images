{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# docker-selenium-base
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
  name = "docker-selenium-base";
  tag = version;

  copyToRoot = [
    (buildEnv {
      name = "docker-selenium-base-root";
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
      "org.opencontainers.image.title" = "docker selenium uase";
      "org.opencontainers.image.description" = "Docker docker-selenium-base";
      "org.opencontainers.image.version" = version;
    };
  };
}
