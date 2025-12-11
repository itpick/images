# gitlab-sidekiq
# =============
# GitLab Sidekiq - Background job processor for GitLab
# https://gitlab.com/gitlab-org/gitlab

{ nix2container, pkgs, lib, ... }:

# GitLab Sidekiq handles background job processing for GitLab
# It runs Sidekiq workers that process jobs queued by the GitLab Rails application

let
  version = "18.6.1";

in
nix2container.buildImage {
  name = "gitlab-sidekiq";
  tag = "v${version}";

  copyToRoot = pkgs.buildEnv {
    name = "gitlab-sidekiq-root";
    paths = with pkgs; [
      # Ruby runtime
      ruby_3_2

      # Shell and utilities
      bash
      dash
      coreutils
      gnugrep

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

      # Process management
      tini

      # Time zone data
      tzdata

      # Create directories
      (pkgs.runCommand "gitlab-sidekiq-dirs" {} ''
        mkdir -p $out/srv/gitlab
        mkdir -p $out/var/log/gitlab
        mkdir -p $out/var/opt/gitlab
        mkdir -p $out/tmp
      '')
    ];
    pathsToLink = [ "/bin" "/etc" "/lib" "/share" "/srv" "/var" "/tmp" ];
  };

  config = {
    entrypoint = [ "${pkgs.tini}/bin/tini" "--" ];
    cmd = [ "${pkgs.ruby_3_2}/bin/bundle" "exec" "sidekiq" ];
    workingDir = "/srv/gitlab";
    env = [
      "RAILS_ENV=production"
      "LANG=C.UTF-8"
    ];
    labels = {
      "org.opencontainers.image.title" = "GitLab Sidekiq";
      "org.opencontainers.image.description" = "Background job processor for GitLab";
      "org.opencontainers.image.version" = version;
      "io.nix-containers.chart" = "gitlab";
    };
  };
}
