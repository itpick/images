{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# docker-machine-driver-harvester
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
  name = "docker-machine-driver-harvester";
  tag = version;

  copyToRoot = [
    (buildEnv {
      name = "docker-machine-driver-harvester-root";
      paths = base.basePackages ++ dockerPkgs ++ [ userEnv ];
    })
  ];

  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv ++ [
      "DOCKER_HOST=unix:///var/run/docker.sock"
    ];
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "docker machine driver harvester";
      "org.opencontainers.image.description" = "Docker docker-machine-driver-harvester";
      "org.opencontainers.image.version" = version;
    };
  };
}
