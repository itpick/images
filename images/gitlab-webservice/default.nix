# gitlab-webservice
# =============
# GitLab Webservice - Main web application for GitLab
# https://gitlab.com/gitlab-org/gitlab

{ nix2container, pkgs, lib, ... }:

# GitLab Webservice is the main Rails web application that serves the GitLab UI and API
# It runs Puma as the application server

let
  version = "18.6.1";

in
nix2container.buildImage {
  name = "gitlab-webservice";
  tag = "v${version}";

  copyToRoot = pkgs.buildEnv {
    name = "gitlab-webservice-root";
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
      (pkgs.runCommand "gitlab-webservice-dirs" {} ''
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
    cmd = [ "${pkgs.ruby_3_2}/bin/bundle" "exec" "puma" "-C" "config/puma.rb" ];
    workingDir = "/srv/gitlab";
    exposedPorts = {
      "8080/tcp" = {};
    };
    env = [
      "RAILS_ENV=production"
      "LANG=C.UTF-8"
    ];
    labels = {
      "org.opencontainers.image.title" = "GitLab Webservice";
      "org.opencontainers.image.description" = "Main web application for GitLab";
      "org.opencontainers.image.version" = version;
      "io.nix-containers.chart" = "gitlab";
    };
  };
}
