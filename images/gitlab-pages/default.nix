# gitlab-pages
# =============
# GitLab Pages - Static site hosting for GitLab
# https://gitlab.com/gitlab-org/gitlab-pages

{ mkImage, pkgs, lib, ... }:

# GitLab Pages serves static websites for GitLab projects

mkImage {
  drv = pkgs.gitlab-pages;
  name = "gitlab-pages";
  tag = "v${pkgs.gitlab-pages.version}";
  entrypoint = [ "${pkgs.gitlab-pages}/bin/gitlab-pages" ];
  cmd = [];

  extraPkgs = with pkgs; [
    cacert
    tzdata
  ];

  env = {
    PAGES_CONFIG_FILE = "/etc/gitlab-pages/config.toml";
  };

  labels = {
    "org.opencontainers.image.title" = "GitLab Pages";
    "org.opencontainers.image.description" = "Static site hosting for GitLab";
    "org.opencontainers.image.version" = pkgs.gitlab-pages.version;
    "io.nix-containers.chart" = "gitlab";
  };
}
