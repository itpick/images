{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

let
  # BusyBox packages
  busyboxPackages = with pkgs; [
    busybox
  ];

  # Use default non-root user environment
  userEnv = nonRoot.mkDefaultUserEnv pkgs [];

in
nix2container.buildImage {
  name = "busybox";
  tag = "latest";

  copyToRoot = [
    (buildEnv {
      name = "busybox-root";
      paths = base.basePackages ++ busyboxPackages ++ [ userEnv ];
    })
  ];

  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv ++ [
      "PATH=${lib.makeBinPath busyboxPackages}"
    ];
    Labels = base.defaultLabels // {
      "org.opencontainers.image.description" = "BusyBox utilities for minimal environments";
      "org.opencontainers.image.url" = "https://github.com/nix-containers/images";
      "org.opencontainers.image.source" = "https://github.com/nix-containers/images";
      "org.opencontainers.image.vendor" = "nix-containers";
      "org.opencontainers.image.version" = pkgs.busybox.version;
      "io.nix-containers.image.upstream" = "https://busybox.net/";
      "io.nix-containers.image.category" = "utility";
      "io.nix-containers.image.aliases" = "busybox,minimal,embedded";
    };
  };
}
