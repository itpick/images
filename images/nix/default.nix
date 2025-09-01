{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

let
  # nix packages
  nixPackages = with pkgs; [
    nix
    bash
    coreutils
  ];

  # Use default non-root user environment
  userEnv = nonRoot.mkDefaultUserEnv pkgs [];

in
nix2container.buildImage {
  name = "nix";
  tag = "latest";

  copyToRoot = [
    (buildEnv {
      name = "nix-root";
      paths = base.basePackages ++ nixPackages ++ [ userEnv ];
    })
  ];

  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv ++ [
      "PATH=${lib.makeBinPath nixPackages}"
    ];
    Labels = base.defaultLabels // {
      "org.opencontainers.image.description" = "Nix package manager and build system";
      "org.opencontainers.image.url" = "https://github.com/nix-containers/images";
      "org.opencontainers.image.source" = "https://github.com/nix-containers/images";
      "org.opencontainers.image.vendor" = "nix-containers";
      "org.opencontainers.image.version" = pkgs.nix.version;
      "io.nix-containers.image.upstream" = "https://nixos.org/";
      "io.nix-containers.image.category" = "build-env";
      "io.nix-containers.image.aliases" = "nix,nixos,package-manager";
    };
  };
}
