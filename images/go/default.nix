{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

let
  goPackages = with pkgs; [
    go
    git
    bash
    coreutils
    findutils
    which
    gcc
    gnumake
  ];

  userEnv = nonRoot.mkDefaultUserEnv pkgs [];

in
nix2container.buildImage {
  name = "go";
  tag = "latest";

  copyToRoot = [
    (buildEnv {
      name = "go-root";
      paths = base.basePackages ++ goPackages ++ [ userEnv ];
    })
  ];

  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv ++ [
      "PATH=${lib.makeBinPath goPackages}"
      "GOPATH=/home/nonroot/go"
      "GOCACHE=/home/nonroot/.cache/go-build"
      "GOMODCACHE=/home/nonroot/go/pkg/mod"
    ];
    Labels = base.defaultLabels // {
      "org.opencontainers.image.description" = "Go programming language with build tools";
      "org.opencontainers.image.url" = "https://github.com/nix-containers/images";
      "org.opencontainers.image.source" = "https://github.com/nix-containers/images";
      "org.opencontainers.image.vendor" = "nix-containers";
      "org.opencontainers.image.version" = pkgs.go.version;
      "io.nix-containers.image.upstream" = "https://golang.org/";
      "io.nix-containers.image.category" = "runtime";
      "io.nix-containers.image.aliases" = "go,golang";
    };
  };
}