# bitnami-shell
# =============
# Shell utility image used by Bitnami Helm charts for init containers and debugging.
# Provides a minimal shell environment with common utilities.

{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

let
  shellPackages = with pkgs; [
    bash
    busybox
    coreutils
    findutils
    gnugrep
    gnused
    gawk
    curl
    wget
    netcat-gnu
    procps
    which
  ];

  userEnv = nonRoot.mkDefaultUserEnv pkgs [];

in
nix2container.buildImage {
  name = "bitnami-shell";
  tag = "latest";

  copyToRoot = [
    (buildEnv {
      name = "bitnami-shell-root";
      paths = base.basePackages ++ shellPackages ++ [ userEnv ];
    })
  ];

  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv ++ [
      "PATH=${lib.makeBinPath shellPackages}"
    ];
    Entrypoint = [ "${pkgs.bash}/bin/bash" ];
    Labels = base.defaultLabels // {
      "org.opencontainers.image.description" = "Shell utility image for Bitnami Helm charts";
      "org.opencontainers.image.url" = "https://github.com/nix-containers/images";
      "org.opencontainers.image.source" = "https://github.com/nix-containers/images";
      "org.opencontainers.image.vendor" = "nix-containers";
      "io.nix-containers.image.category" = "utility";
      "io.nix-containers.image.aliases" = "bitnami-shell,shell,utility";
    };
  };
}
