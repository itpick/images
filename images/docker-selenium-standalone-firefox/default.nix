{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# docker-selenium-standalone-firefox
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
  name = "docker-selenium-standalone-firefox";
  tag = version;

  copyToRoot = [
    (buildEnv {
      name = "docker-selenium-standalone-firefox-root";
      paths = base.basePackages ++ dockerPkgs ++ [ userEnv ];
    })
  ];

  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv ++ [
      "DOCKER_HOST=unix:///var/run/docker.sock"
    ];
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "docker selenium standalone firefox";
      "org.opencontainers.image.description" = "Docker docker-selenium-standalone-firefox";
      "org.opencontainers.image.version" = version;
    };
  };
}
