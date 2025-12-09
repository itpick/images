{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:


# Chainguard SBOM packages for docker-compose:
# Packages available in nixpkgs:
#   pkgs.docker-compose  # docker-compose (5.0.0-r1)
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
# Packages NOT in nixpkgs:
#   ld-linux (2.42-r4)

let
  # docker-compose packages
  docker_composePackages = with pkgs; [
    docker-compose
    bash
    coreutils
  ];

in
nix2container.buildImage {
  name = "docker-compose";
  tag = "latest";

  copyToRoot = [
    (buildEnv {
      name = "docker-compose-root";
      paths = base.basePackages ++ docker_composePackages;
    })
  ];

  # Chainguard runs docker-compose as root
  config = nonRoot.rootConfig // {
    Env = base.defaultEnv ++ nonRoot.rootEnv ++ [
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
