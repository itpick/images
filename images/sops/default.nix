{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

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