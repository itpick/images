{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# docker-credential-ecr-login-fips
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
  name = "docker-credential-ecr-login-fips";
  tag = version;

  copyToRoot = [
    (buildEnv {
      name = "docker-credential-ecr-login-fips-root";
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
      "org.opencontainers.image.title" = "docker credential ecr login";
      "org.opencontainers.image.description" = "Docker docker-credential-ecr-login";
      "org.opencontainers.image.version" = version;
    };
  };
}
