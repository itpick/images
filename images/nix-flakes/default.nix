{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

let
  # nix-flakes packages
  nix_flakesPackages = with pkgs; [
    nix
    bash
    coreutils
  ];

  # Use default non-root user environment
  userEnv = nonRoot.mkDefaultUserEnv pkgs [];

in
nix2container.buildImage {
  name = "nix-flakes";
  tag = "latest";

  copyToRoot = [
    (buildEnv {
      name = "nix-flakes-root";
      paths = base.basePackages ++ nix_flakesPackages ++ [ userEnv ];
    })
  ];

  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv ++ [
      "PATH=${lib.makeBinPath nix_flakesPackages}"
    ];
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.description" = "Nix package manager with Flakes support for reproducible builds";
      "org.opencontainers.image.version" = pkgs.nix.version;
      "org.opencontainers.image.url" = "https://github.com/nix-containers/images";
      "org.opencontainers.image.source" = "https://github.com/nix-containers/images";
      "org.opencontainers.image.vendor" = "nix-containers";
      "io.nix-containers.image.upstream" = "https://nixos.org/";
      "io.nix-containers.image.category" = "devops-tool";
      "io.nix-containers.image.aliases" = "nix-flakes,nix,flakes";
    };
  };
}
