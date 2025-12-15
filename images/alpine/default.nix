{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# Alpine-compatible image using BusyBox
# This provides a minimal environment similar to Alpine Linux
# but built with Nix for reproducibility

let
  alpinePackages = with pkgs; [
    busybox
    cacert
  ];

  userEnv = nonRoot.mkDefaultUserEnv pkgs [];

in
nix2container.buildImage {
  name = "alpine";
  tag = "latest";

  copyToRoot = [
    (buildEnv {
      name = "alpine-root";
      paths = base.basePackages ++ alpinePackages ++ [ userEnv ];
    })
  ];

  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv ++ [
      "PATH=${lib.makeBinPath alpinePackages}"
    ];
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.description" = "Alpine-compatible minimal environment";
      "org.opencontainers.image.url" = "https://github.com/nix-containers/images";
      "org.opencontainers.image.source" = "https://github.com/nix-containers/images";
      "org.opencontainers.image.vendor" = "nix-containers";
      "org.opencontainers.image.version" = pkgs.busybox.version;
      "io.nix-containers.image.upstream" = "https://alpinelinux.org/";
      "io.nix-containers.image.category" = "base";
      "io.nix-containers.image.aliases" = "alpine,minimal,base";
    };
  };
}
