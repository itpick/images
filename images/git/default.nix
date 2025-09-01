{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

let
  gitPackages = with pkgs; [
    git
    openssh
    gnupg
    bash
    coreutils
    findutils
    gawk
    gnused
    gnugrep
  ];

  userEnv = nonRoot.mkDefaultUserEnv pkgs [];

in
nix2container.buildImage {
  name = "git";
  tag = "latest";

  copyToRoot = [
    (buildEnv {
      name = "git-root";
      paths = base.basePackages ++ gitPackages ++ [ userEnv ];
    })
  ];

  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv ++ [
      "PATH=${lib.makeBinPath gitPackages}"
      "GIT_SSL_CAINFO=${pkgs.cacert}/etc/ssl/certs/ca-bundle.crt"
    ];
    Labels = base.defaultLabels // {
      "org.opencontainers.image.description" = "Git version control system with SSH and GPG support";
      "org.opencontainers.image.url" = "https://github.com/nix-containers/images";
      "org.opencontainers.image.source" = "https://github.com/nix-containers/images";
      "org.opencontainers.image.vendor" = "nix-containers";
      "org.opencontainers.image.version" = pkgs.git.version;
      "io.nix-containers.image.upstream" = "https://git-scm.com/";
      "io.nix-containers.image.category" = "devops-tool";
      "io.nix-containers.image.aliases" = "git,vcs";
    };
  };
}