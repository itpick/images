{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:


# Chainguard SBOM packages for glibc-dynamic:
# Packages available in nixpkgs:
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
# Packages NOT in nixpkgs:
#   ld-linux (2.42-r4)
#   libstdc++ (15.2.0-r6)

let
  glibcPackages = with pkgs; [
    glibc
    bash
    coreutils
    findutils
    which
  ];

  userEnv = nonRoot.mkDefaultUserEnv pkgs [];

in
nix2container.buildImage {
  name = "glibc-dynamic";
  tag = "latest";

  copyToRoot = [
    (buildEnv {
      name = "glibc-dynamic-root";
      paths = base.basePackages ++ glibcPackages ++ [ userEnv ];
    })
  ];

  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv ++ [
      "PATH=${lib.makeBinPath glibcPackages}"
    ];
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.description" = "Dynamically linked glibc base image";
      "org.opencontainers.image.version" = pkgs.glibc.version;
      "org.opencontainers.image.url" = "https://github.com/nix-containers/images";
      "org.opencontainers.image.source" = "https://github.com/nix-containers/images";
      "org.opencontainers.image.vendor" = "nix-containers";
      "io.nix-containers.image.upstream" = "https://www.gnu.org/software/libc/";
      "io.nix-containers.image.category" = "utility";
      "io.nix-containers.image.aliases" = "glibc,glibc-dynamic,base";
    };
  };
}