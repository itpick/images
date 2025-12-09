{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:


# Chainguard SBOM packages for static:
# Packages available in nixpkgs:
#   pkgs.tzdata  # tzdata (2025b-r2)

let
  staticPackages = with pkgs.pkgsStatic; [
    bash
    coreutils
    findutils
    which
  ];

  userEnv = nonRoot.mkDefaultUserEnv pkgs [];

in
nix2container.buildImage {
  name = "static";
  tag = "latest";

  copyToRoot = [
    (buildEnv {
      name = "static-root";
      paths = staticPackages ++ [ userEnv ];
    })
  ];

  config = nonRoot.defaultConfig // {
    Env = nonRoot.userEnv ++ [
      "PATH=${lib.makeBinPath staticPackages}"
    ];
    Labels = base.defaultLabels // {
      "org.opencontainers.image.description" = "Statically linked base image with essential tools";
      "org.opencontainers.image.version" = pkgs.busybox.version;
      "org.opencontainers.image.url" = "https://github.com/nix-containers/images";
      "org.opencontainers.image.source" = "https://github.com/nix-containers/images";
      "org.opencontainers.image.vendor" = "nix-containers";
      "io.nix-containers.image.upstream" = "https://www.gnu.org/software/coreutils/";
      "io.nix-containers.image.category" = "utility";
      "io.nix-containers.image.aliases" = "static,base,minimal";
    };
  };
}