{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

let
  # Cachix packages
  cachixPackages = with pkgs; [
    cachix
    bash
    coreutils
  ];

  # Use default non-root user environment
  userEnv = nonRoot.mkDefaultUserEnv pkgs [];

in
nix2container.buildImage {
  name = "cachix";
  tag = "latest";

  copyToRoot = [
    (buildEnv {
      name = "cachix-root";
      paths = base.basePackages ++ cachixPackages ++ [ userEnv ];
    })
  ];

  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv ++ [
      "PATH=${lib.makeBinPath cachixPackages}"
    ];
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.description" = "Cachix binary cache client for Nix packages";
      "org.opencontainers.image.version" = pkgs.cachix.version;
      "org.opencontainers.image.url" = "https://github.com/nix-containers/images";
      "org.opencontainers.image.source" = "https://github.com/nix-containers/images";
      "org.opencontainers.image.vendor" = "nix-containers";
      "io.nix-containers.image.upstream" = "https://www.cachix.org/";
      "io.nix-containers.image.category" = "devops-tool";
      "io.nix-containers.image.aliases" = "cachix,cache";
    };
  };
}
