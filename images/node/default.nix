{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

let
  nodePackages = with pkgs; [
    nodejs_22
    yarn
    git
    bash
    coreutils
    findutils
    which
    gcc
    gnumake
    python3
  ];

  userEnv = nonRoot.mkDefaultUserEnv pkgs [];

in
nix2container.buildImage {
  name = "node";
  tag = "latest";

  copyToRoot = [
    (buildEnv {
      name = "node-root";
      paths = base.basePackages ++ nodePackages ++ [ userEnv ];
    })
  ];

  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv ++ [
      "PATH=${lib.makeBinPath nodePackages}"
      "NPM_CONFIG_PREFIX=/home/nonroot/.npm-global"
      "NODE_PATH=/home/nonroot/.npm-global/lib/node_modules"
    ];
    Labels = base.defaultLabels // {
      "org.opencontainers.image.description" = "Node.js JavaScript runtime with npm and yarn";
      "org.opencontainers.image.url" = "https://github.com/nix-containers/images";
      "org.opencontainers.image.source" = "https://github.com/nix-containers/images";
      "org.opencontainers.image.vendor" = "nix-containers";
      "org.opencontainers.image.version" = pkgs.nodejs.version;
      "io.nix-containers.image.upstream" = "https://nodejs.org/";
      "io.nix-containers.image.category" = "runtime";
      "io.nix-containers.image.aliases" = "node,nodejs,javascript";
    };
  };
}