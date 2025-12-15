{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:


# Chainguard SBOM packages for hugo:
# Packages available in nixpkgs:
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.hugo  # hugo (0.152.2-r2)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
# Packages NOT in nixpkgs:
#   ld-linux (2.42-r4)
#   libstdc++ (15.2.0-r6)

let
  # hugo packages
  hugoPackages = with pkgs; [
    hugo
    bash
    coreutils
  ];

  # Use default non-root user environment
  userEnv = nonRoot.mkDefaultUserEnv pkgs [];

in
nix2container.buildImage {
  name = "hugo";
  tag = "latest";

  copyToRoot = [
    (buildEnv {
      name = "hugo-root";
      paths = base.basePackages ++ hugoPackages ++ [ userEnv ];
    })
  ];

  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv ++ [
      "PATH=${lib.makeBinPath hugoPackages}"
    ];
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.description" = "Hugo static site generator for fast and flexible website development";
      "org.opencontainers.image.url" = "https://github.com/nix-containers/images";
      "org.opencontainers.image.source" = "https://github.com/nix-containers/images";
      "org.opencontainers.image.vendor" = "nix-containers";
      "org.opencontainers.image.version" = pkgs.hugo.version;
      "io.nix-containers.image.upstream" = "https://gohugo.io/";
      "io.nix-containers.image.category" = "devops-tool";
      "io.nix-containers.image.aliases" = "hugo,static-site,website";
    };
  };
}
