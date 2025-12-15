{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:


# Chainguard SBOM packages for sops:
# Packages available in nixpkgs:
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.kustomize  # kustomize (5.8.0-r1)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
# Packages NOT in nixpkgs:
#   ksops (4.4.0-r3)
#   ld-linux (2.42-r4)

let
  # SOPS tools and dependencies
  sopsPackages = with pkgs; [
    bash
    coreutils
    git
    sops
    jq
    kubectl
    vim
    gnupg
  ];

  # Use default non-root user environment
  userEnv = nonRoot.mkDefaultUserEnv pkgs [];

in
nix2container.buildImage {
  name = "sops-base";
  tag = "latest";

  copyToRoot = [
    (buildEnv {
      name = "sops-root";
      paths = base.basePackages ++ sopsPackages ++ [ userEnv ];
    })
  ];

  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv ++ [
      "PATH=${lib.makeBinPath sopsPackages}"
      "GNUPGHOME=~/.gnupg"
    ];
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.description" = "SOPS (Secrets OPerationS) for secure secrets management with encryption";
      "org.opencontainers.image.url" = "https://github.com/nix-containers/images";
      "org.opencontainers.image.source" = "https://github.com/nix-containers/images";
      "org.opencontainers.image.vendor" = "nix-containers";
      "org.opencontainers.image.version" = pkgs.sops.version;
      "io.nix-containers.image.upstream" = "https://github.com/mozilla/sops";
      "io.nix-containers.image.category" = "devops-tool";
      "io.nix-containers.image.aliases" = "sops,secrets,encryption";
    };
  };
}