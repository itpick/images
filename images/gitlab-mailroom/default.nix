# gitlab-mailroom
# =============
# GitLab Mailroom - Email processing for GitLab
# https://gitlab.com/gitlab-org/gitlab/-/tree/master/lib/gitlab/mail_room

{ nix2container, pkgs, lib, ... }:

# GitLab Mailroom handles incoming email processing for GitLab
# It's a Ruby application that processes emails for creating issues, merge requests, etc.

let
  version = "18.6.1";

in
nix2container.buildImage {
  name = "gitlab-mailroom";
  tag = "v${version}";

  copyToRoot = pkgs.buildEnv {
    name = "gitlab-mailroom-root";
    paths = with pkgs; [
      # Ruby runtime
      ruby_3_2

      # Shell and utilities
      bash
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
      (pkgs.runCommand "gitlab-mailroom-dirs" {} ''
        mkdir -p $out/srv/gitlab
        mkdir -p $out/var/log/gitlab
        mkdir -p $out/tmp
      '')
    ];
    pathsToLink = [ "/bin" "/etc" "/lib" "/share" "/srv" "/var" "/tmp" ];
  };

  config = {
    entrypoint = [ "${pkgs.tini}/bin/tini" "--" ];
    cmd = [ "${pkgs.ruby_3_2}/bin/ruby" "bin/mail_room" ];
    workingDir = "/srv/gitlab";
    env = [
      "LANG=C.UTF-8"
    ];
    labels = {
      "org.opencontainers.image.title" = "GitLab Mailroom";
      "org.opencontainers.image.description" = "Email processing service for GitLab";
      "org.opencontainers.image.version" = version;
      "io.nix-containers.chart" = "gitlab";
    };
  };
}
