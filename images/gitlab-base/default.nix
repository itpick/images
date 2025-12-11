# gitlab-base
# =============
# GitLab Base - Base image with common GitLab dependencies
# https://gitlab.com/gitlab-org/gitlab

{ nix2container, pkgs, lib, ... }:

# GitLab Base provides common runtime dependencies for GitLab services

let
  version = "18.6.1";

in
nix2container.buildImage {
  name = "gitlab-base";
  tag = "v${version}";

  copyToRoot = pkgs.buildEnv {
    name = "gitlab-base-root";
    paths = with pkgs; [
      # Shell and core utilities
      bash
      busybox
      coreutils
      findutils
      gawk
      gnugrep
      less
      procps

      # Network and SSL
      curl
      cacert
      openssl

      # Process management
      tini

      # Templating
      gomplate

      # Time zone data
      tzdata

      # Create required directories
      (pkgs.runCommand "gitlab-base-dirs" {} ''
        mkdir -p $out/srv/gitlab
        mkdir -p $out/var/log/gitlab
        mkdir -p $out/var/opt/gitlab
        mkdir -p $out/etc/gitlab
        mkdir -p $out/tmp
      '')
    ];
    pathsToLink = [ "/bin" "/etc" "/lib" "/share" "/srv" "/var" "/tmp" ];
  };

  config = {
    entrypoint = [ "${pkgs.tini}/bin/tini" "--" ];
    cmd = [ "/bin/bash" ];
    workingDir = "/srv/gitlab";
    env = [
      "LANG=C.UTF-8"
      "TZ=UTC"
    ];
    labels = {
      "org.opencontainers.image.title" = "GitLab Base";
      "org.opencontainers.image.description" = "Base image with common GitLab dependencies";
      "org.opencontainers.image.version" = version;
      "io.nix-containers.chart" = "gitlab";
    };
  };
}
