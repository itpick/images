{ mkImage, pkgs, lib, ... }:

# GitLab - DevOps platform
# https://about.gitlab.com/

mkImage {
  drv = pkgs.gitlab;
  name = "gitlab";
  tag = "v18.6.1";
  entrypoint = [ "${pkgs.gitlab}/bin/gitlab-rake" ];
  cmd = [ "--help" ];

  extraPkgs = with pkgs; [ cacert ];

  labels = {
    "org.opencontainers.image.title" = "GitLab";
    "org.opencontainers.image.description" = "GitLab Community Edition";
    "org.opencontainers.image.version" = "18.6.1";
  };
}
