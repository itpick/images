{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# golang - alias for go image
# Provides the same Go development environment

# Chainguard SBOM packages for golang:
# Packages available in nixpkgs:
#   pkgs.bash  # bash (5.3-r3)
#   pkgs.binutils  # binutils (2.45.1-r2)
#   pkgs.busybox  # busybox (1.37.0-r50)
#   pkgs.gcc  # gcc (15.2.0-r6)
#   pkgs.git  # git (2.52.0-r0)
#   pkgs.go  # go-1.25 (1.25.5-r0)

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

in
nix2container.buildImage {
  name = "golang";
  tag = "latest";

  copyToRoot = [
    (buildEnv {
      name = "golang-root";
      paths = base.basePackages ++ goPackages;
    })
  ];

  # Chainguard runs go as root
  config = nonRoot.rootConfig // {
    Env = base.defaultEnv ++ nonRoot.rootEnv ++ [
      "PATH=${lib.makeBinPath goPackages}"
      "GOPATH=/root/go"
      "GOCACHE=/root/.cache/go-build"
      "GOMODCACHE=/root/go/pkg/mod"
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
