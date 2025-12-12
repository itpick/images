{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# docker-credential-gcr-fips
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
  name = "docker-credential-gcr-fips";
  tag = version;

  copyToRoot = [
    (buildEnv {
      name = "docker-credential-gcr-fips-root";
      paths = base.basePackages ++ dockerPkgs ++ [ userEnv ];
    })
  ];

  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv ++ [
      "DOCKER_HOST=unix:///var/run/docker.sock"
    ];
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "docker credential gcr";
      "org.opencontainers.image.description" = "Docker docker-credential-gcr";
      "org.opencontainers.image.version" = version;
    };
  };
}
