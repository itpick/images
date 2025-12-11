# gitaly
# =============
# Gitaly - Git RPC service for GitLab
# https://gitlab.com/gitlab-org/gitaly

{ mkImage, pkgs, lib, ... }:

# Gitaly is a Git RPC service that handles all Git calls made by GitLab

mkImage {
  drv = pkgs.gitaly;
  name = "gitaly";
  tag = "v${pkgs.gitaly.version}";
  entrypoint = [ "${pkgs.gitaly}/bin/gitaly" ];
  cmd = [ "/etc/gitaly/config.toml" ];

  extraPkgs = with pkgs; [
    # Shell and utilities
    bash
    busybox
    coreutils
    findutils
    gawk
    gnugrep
    less

    # Git and related
    git

    # Network and SSL
    curl
    cacert
    openssh

    # Compression
    bzip2
    gzip

    # Templating
    gomplate

    # Process management
    tini

    # Time zone data
    tzdata

    # Ruby runtime (for hooks)
    ruby_3_2
  ];

  env = {
    GITALY_CONFIG_FILE = "/etc/gitaly/config.toml";
  };

  labels = {
    "org.opencontainers.image.title" = "Gitaly";
    "org.opencontainers.image.description" = "Git RPC service for GitLab";
    "org.opencontainers.image.version" = pkgs.gitaly.version;
    "io.nix-containers.chart" = "gitlab";
  };
}
