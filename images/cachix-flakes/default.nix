{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

let
  # cachix-flakes packages
  cachix_flakesPackages = with pkgs; [
    cachix
    bash
    coreutils
  ];

  # Use default non-root user environment
  userEnv = nonRoot.mkDefaultUserEnv pkgs [];

in
nix2container.buildImage {
  name = "cachix-flakes";
  tag = "latest";

  copyToRoot = [
    (buildEnv {
      name = "cachix-flakes-root";
      paths = base.basePackages ++ cachix_flakesPackages ++ [ userEnv ];
    })
  ];

  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv ++ [
      "PATH=${lib.makeBinPath cachix_flakesPackages}"
    ];
    Labels = base.defaultLabels // {
      "org.opencontainers.image.description" = "Cachix binary cache client optimized for Nix Flakes workflows";
      "org.opencontainers.image.version" = pkgs.cachix.version;
      "org.opencontainers.image.url" = "https://github.com/nix-containers/images";
      "org.opencontainers.image.source" = "https://github.com/nix-containers/images";
      "org.opencontainers.image.vendor" = "nix-containers";
      "io.nix-containers.image.upstream" = "https://www.cachix.org/";
      "io.nix-containers.image.category" = "devops-tool";
      "io.nix-containers.image.aliases" = "cachix-flakes,cachix,cache";
    };
  };
}
