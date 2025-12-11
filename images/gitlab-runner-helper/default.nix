# gitlab-runner-helper
# =============
# Helper image for GitLab Runner that provides utilities for CI/CD jobs.
# Used alongside gitlab-runner for job execution.

{ mkImage, pkgs, lib, ... }:

# Chainguard SBOM packages for gitlab-runner-helper:
# Packages available in nixpkgs:
#   pkgs.bash  # bash (5.3-r3)
#   pkgs.busybox  # busybox (1.37.0-r50)
#   pkgs.dumb-init  # dumb-init (1.2.5-r9)
#   pkgs.git-lfs  # git-lfs (3.7.1-r2)
#   pkgs.gitlab-runner  # gitlab-runner-18.6 (18.6.3-r1)

mkImage {
  drv = pkgs.gitlab-runner;
  name = "gitlab-runner-helper";
  tag = "v${pkgs.gitlab-runner.version}";
  entrypoint = [ "${pkgs.gitlab-runner}/bin/gitlab-runner-helper" ];
  cmd = [];

  extraPkgs = with pkgs; [ bash busybox dumb-init git git-lfs ];

  labels = {
    "org.opencontainers.image.title" = "GitLab Runner Helper";
    "org.opencontainers.image.description" = "Helper image for GitLab CI/CD runner jobs";
    "org.opencontainers.image.version" = pkgs.gitlab-runner.version;
    "io.nix-containers.chart" = "gitlab-runner";
  };
}
