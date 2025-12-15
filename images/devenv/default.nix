{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

let
  # devenv packages
  devenvPackages = with pkgs; [
    devenv
    bash
    coreutils
  ];

  # Use default non-root user environment
  userEnv = nonRoot.mkDefaultUserEnv pkgs [];

in
nix2container.buildImage {
  name = "devenv";
  tag = "latest";

  copyToRoot = [
    (buildEnv {
      name = "devenv-root";
      paths = base.basePackages ++ devenvPackages ++ [ userEnv ];
    })
  ];

  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv ++ [
      "PATH=${lib.makeBinPath devenvPackages}"
    ];
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.description" = "DevEnv for fast, declarative, and reproducible developer environments";
      "org.opencontainers.image.version" = pkgs.devenv.version;
      "org.opencontainers.image.url" = "https://github.com/nix-containers/images";
      "org.opencontainers.image.source" = "https://github.com/nix-containers/images";
      "org.opencontainers.image.vendor" = "nix-containers";
      "io.nix-containers.image.upstream" = "https://devenv.sh/";
      "io.nix-containers.image.category" = "devops-tool";
      "io.nix-containers.image.aliases" = "devenv,dev-env";
    };
  };
}
