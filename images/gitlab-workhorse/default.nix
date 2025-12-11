# gitlab-workhorse
# =============
# GitLab Workhorse - Smart reverse proxy for GitLab
# https://gitlab.com/gitlab-org/gitlab/-/tree/master/workhorse

{ mkImage, pkgs, lib, ... }:

# GitLab Workhorse is a smart reverse proxy for GitLab that handles git HTTP sessions,
# large file uploads, and other special requests

mkImage {
  drv = pkgs.gitlab-workhorse;
  name = "gitlab-workhorse";
  tag = "v${pkgs.gitlab-workhorse.version}";
  entrypoint = [ "${pkgs.gitlab-workhorse}/bin/gitlab-workhorse" ];
  cmd = [];

  extraPkgs = with pkgs; [
    cacert
    git
    git-lfs
    tzdata
  ];

  labels = {
    "org.opencontainers.image.title" = "GitLab Workhorse";
    "org.opencontainers.image.description" = "Smart reverse proxy for GitLab";
    "org.opencontainers.image.version" = pkgs.gitlab-workhorse.version;
    "io.nix-containers.chart" = "gitlab";
  };
}
