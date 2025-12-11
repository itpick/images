# gitlab-exporter
# =============
# GitLab Exporter - Prometheus metrics exporter for GitLab
# https://gitlab.com/gitlab-org/gitlab-exporter

{ nix2container, pkgs, lib, ... }:

# GitLab Exporter provides Prometheus metrics for GitLab components
# It's a Ruby application that connects to GitLab's internal components

let
  version = "18.6.1";

in
nix2container.buildImage {
  name = "gitlab-exporter";
  tag = "v${version}";

  copyToRoot = pkgs.buildEnv {
    name = "gitlab-exporter-root";
    paths = with pkgs; [
      # Ruby runtime
      ruby_3_2

      # Shell and utilities
      bash
      busybox
      coreutils
      curl
      cacert

      # Database client
      postgresql

      # Process management
      tini

      # Time zone data
      tzdata

      # Create directories
      (pkgs.runCommand "gitlab-exporter-dirs" {} ''
        mkdir -p $out/srv/gitlab-exporter
        mkdir -p $out/var/log/gitlab
        mkdir -p $out/tmp
      '')
    ];
    pathsToLink = [ "/bin" "/etc" "/lib" "/share" "/srv" "/var" "/tmp" ];
  };

  config = {
    entrypoint = [ "${pkgs.tini}/bin/tini" "--" ];
    cmd = [ "${pkgs.ruby_3_2}/bin/ruby" "/srv/gitlab-exporter/gitlab-exporter" ];
    workingDir = "/srv/gitlab-exporter";
    exposedPorts = {
      "9168/tcp" = {};
    };
    env = [
      "GITLAB_EXPORTER_PORT=9168"
    ];
    labels = {
      "org.opencontainers.image.title" = "GitLab Exporter";
      "org.opencontainers.image.description" = "Prometheus metrics exporter for GitLab";
      "org.opencontainers.image.version" = version;
      "io.nix-containers.chart" = "gitlab";
    };
  };
}
