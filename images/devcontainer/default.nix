{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

let
  # devcontainer packages
  devcontainerPackages = with pkgs; [
    devcontainer
    bash
    coreutils
  ];

  # Use default non-root user environment
  userEnv = nonRoot.mkDefaultUserEnv pkgs [];

in
nix2container.buildImage {
  name = "devcontainer";
  tag = "latest";

  copyToRoot = [
    (buildEnv {
      name = "devcontainer-root";
      paths = base.basePackages ++ devcontainerPackages ++ [ userEnv ];
    })
  ];

  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv ++ [
      "PATH=${lib.makeBinPath devcontainerPackages}"
    ];
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.description" = "DevContainer CLI for development containers with VS Code";
      "org.opencontainers.image.version" = pkgs.bash.version;
      "org.opencontainers.image.url" = "https://github.com/nix-containers/images";
      "org.opencontainers.image.source" = "https://github.com/nix-containers/images";
      "org.opencontainers.image.vendor" = "nix-containers";
      "io.nix-containers.image.upstream" = "https://containers.dev/";
      "io.nix-containers.image.category" = "devops-tool";
      "io.nix-containers.image.aliases" = "devcontainer,dev-container,vscode";
    };
  };
}
