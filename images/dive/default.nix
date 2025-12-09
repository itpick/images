{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:


# Chainguard SBOM packages for dive:
# Packages available in nixpkgs:
#   pkgs.dive  # dive (0.13.1-r10)

let
  divePackages = with pkgs; [
    dive
    bash
    coreutils
    findutils
    which
  ];

  userEnv = nonRoot.mkDefaultUserEnv pkgs [];

in
nix2container.buildImage {
  name = "dive";
  tag = "latest";

  copyToRoot = [
    (buildEnv {
      name = "dive-root";
      paths = base.basePackages ++ divePackages ++ [ userEnv ];
    })
  ];

  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv ++ [
      "PATH=${lib.makeBinPath divePackages}"
    ];
    Labels = base.defaultLabels // {
      "org.opencontainers.image.description" = "Tool for exploring a docker image, layer contents, and discovering ways to shrink size";
      "org.opencontainers.image.url" = "https://github.com/nix-containers/images";
      "org.opencontainers.image.source" = "https://github.com/nix-containers/images";
      "org.opencontainers.image.vendor" = "nix-containers";
      "org.opencontainers.image.version" = pkgs.dive.version;
      "io.nix-containers.image.upstream" = "https://github.com/wagoodman/dive";
      "io.nix-containers.image.category" = "devops-tool";
      "io.nix-containers.image.aliases" = "dive,docker-dive";
    };
  };
}