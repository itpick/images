{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

let
  # nix-unstable packages
  nix_unstablePackages = with pkgs; [
    nixVersions.latest
    bash
    coreutils
  ];

  # Use default non-root user environment
  userEnv = nonRoot.mkDefaultUserEnv pkgs [];

in
nix2container.buildImage {
  name = "nix-unstable";
  tag = "latest";

  copyToRoot = [
    (buildEnv {
      name = "nix-unstable-root";
      paths = base.basePackages ++ nix_unstablePackages ++ [ userEnv ];
    })
  ];

  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv ++ [
      "PATH=${lib.makeBinPath nix_unstablePackages}"
    ];
    Labels = base.defaultLabels // {
      "org.opencontainers.image.description" = "Latest unstable Nix package manager with experimental features";
      "org.opencontainers.image.version" = pkgs.nix.version;
      "org.opencontainers.image.url" = "https://github.com/nix-containers/images";
      "org.opencontainers.image.source" = "https://github.com/nix-containers/images";
      "org.opencontainers.image.vendor" = "nix-containers";
      "io.nix-containers.image.upstream" = "https://nixos.org/";
      "io.nix-containers.image.category" = "devops-tool";
      "io.nix-containers.image.aliases" = "nix-unstable,nix-latest,nix-experimental";
    };
  };
}
