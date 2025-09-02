{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

let
  # docker-compose packages
  docker_composePackages = with pkgs; [
    docker-compose
    bash
    coreutils
  ];

  # Use default non-root user environment
  userEnv = nonRoot.mkDefaultUserEnv pkgs [];

in
nix2container.buildImage {
  name = "docker-compose";
  tag = "latest";

  copyToRoot = [
    (buildEnv {
      name = "docker-compose-root";
      paths = base.basePackages ++ docker_composePackages ++ [ userEnv ];
    })
  ];

  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv ++ [
      "PATH=${lib.makeBinPath docker_composePackages}"
    ];
    Labels = base.defaultLabels // {
      "org.opencontainers.image.description" = "Docker Compose for multi-container applications";
      "org.opencontainers.image.version" = pkgs.docker-compose.version;
      "org.opencontainers.image.url" = "https://github.com/nix-containers/images";
      "org.opencontainers.image.source" = "https://github.com/nix-containers/images";
      "org.opencontainers.image.vendor" = "nix-containers";
      "io.nix-containers.image.upstream" = "https://docs.docker.com/compose/";
      "io.nix-containers.image.category" = "devops-tool";
      "io.nix-containers.image.aliases" = "docker-compose,compose,orchestration";
    };
  };
}
