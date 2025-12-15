{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:


# Chainguard SBOM packages for node:
# Packages available in nixpkgs:
#   pkgs.busybox  # busybox (1.37.0-r50)
#   pkgs.c-ares  # c-ares (1.34.5-r3)
#   pkgs.dumb-init  # dumb-init (1.2.5-r9)
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libev  # libev (4.33-r9)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.libnghttp2  # libnghttp2-14 (1.68.0-r0)
#   pkgs.libuv  # libuv (1.51.0-r2)
#   pkgs.libxcrypt  # libxcrypt (4.5.2-r0)
#   pkgs.nghttp2  # nghttp2 (1.68.0-r0)
#   pkgs.nodejs  # nodejs-25 (25.2.1-r0)
#   pkgs.npm-check  # npm (11.6.4-r0)
#   pkgs.zlib  # zlib (1.3.1-r51)
# Packages NOT in nixpkgs:
#   icu78-data-full (78.1-r0)
#   ld-linux (2.42-r4)
#   libbrotlicommon1 (1.2.0-r1)
#   libbrotlidec1 (1.2.0-r1)
#   libbrotlienc1 (1.2.0-r1)
#   libcrypt1 (2.42-r4)
#   libcrypto3 (3.6.0-r4)
#   libicu78 (78.1-r0)
#   libssl3 (3.6.0-r4)
#   libstdc++ (15.2.0-r6)

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
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
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