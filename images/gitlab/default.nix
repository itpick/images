{ mkImage, pkgs, lib, ... }:

# GitLab - DevOps platform
# https://about.gitlab.com/

mkImage {
  drv = pkgs.gitlab;
  name = "gitlab";
  # Track pkgs.gitlab.version rather than a hardcoded string — the tag
  # was pinned to 18.6.1 while pkgs.gitlab had already advanced through
  # nixpkgs bumps to 18.11.2. Downstream operators pulling `:v18.6.1`
  # were actually getting whatever nixpkgs currently ships, with no
  # image tag ever matching the real code inside.
  tag = "v${pkgs.gitlab.version}";
  entrypoint = [ "${pkgs.gitlab}/bin/gitlab-rake" ];
  cmd = [ "--help" ];

  extraPkgs = with pkgs; [ cacert ];

  labels = {
    "org.opencontainers.image.title" = "GitLab";
    "org.opencontainers.image.description" = "GitLab Community Edition";
    "org.opencontainers.image.version" = pkgs.gitlab.version;
  };
}
