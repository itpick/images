# gitlab-toolbox
# =============
# GitLab Toolbox - Administrative tools for GitLab
# https://gitlab.com/gitlab-org/gitlab

{ nix2container, pkgs, lib, ... }:

# GitLab Toolbox provides administrative and maintenance tools for GitLab
# Includes rake tasks, backup utilities, and other admin tools

let
  version = "18.6.1";

in
nix2container.buildImage {
  name = "gitlab-toolbox";
  tag = "v${version}";

  copyToRoot = pkgs.buildEnv {
    name = "gitlab-toolbox-root";
    paths = with pkgs; [
      # Ruby runtime
      ruby_3_2

      # Shell and utilities
      bash
      dash
      busybox
      coreutils
      findutils
      gawk
      gnugrep
      less

      # Git for repository operations
      git
      git-lfs

      # GPG for signing
      gnupg

      # Database clients
      postgresql
      redis

      # Network
      curl
      cacert
      openssh

      # Process management
      tini

      # Time zone data
      tzdata

      # Create directories
      (pkgs.runCommand "gitlab-toolbox-dirs" {} ''
        mkdir -p $out/srv/gitlab
        mkdir -p $out/var/log/gitlab
        mkdir -p $out/var/opt/gitlab
        mkdir -p $out/tmp
        mkdir -p $out/backups
      '')
    ];
    pathsToLink = [ "/bin" "/etc" "/lib" "/share" "/srv" "/var" "/tmp" "/backups" ];
  };

  config = {
    entrypoint = [ "${pkgs.tini}/bin/tini" "--" ];
    cmd = [ "/bin/bash" ];
    workingDir = "/srv/gitlab";
    env = [
      "RAILS_ENV=production"
      "LANG=C.UTF-8"
    ];
    labels = {
      "org.opencontainers.image.title" = "GitLab Toolbox";
      "org.opencontainers.image.description" = "Administrative tools for GitLab";
      "org.opencontainers.image.version" = version;
      "io.nix-containers.chart" = "gitlab";
    };
  };
}
