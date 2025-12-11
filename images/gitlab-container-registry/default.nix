# gitlab-container-registry
# =============
# GitLab Container Registry - Docker registry for GitLab
# https://gitlab.com/gitlab-org/container-registry

{ mkImage, pkgs, lib, ... }:

# GitLab Container Registry is a fork of Docker Registry with GitLab integration

mkImage {
  drv = pkgs.gitlab-container-registry;
  name = "gitlab-container-registry";
  tag = "v${pkgs.gitlab-container-registry.version}";
  entrypoint = [ "${pkgs.gitlab-container-registry}/bin/registry" ];
  cmd = [ "serve" "/etc/docker/registry/config.yml" ];

  extraPkgs = with pkgs; [
    bash
    busybox
    coreutils
    curl
    cacert
    tini
    tzdata
  ];

  env = {
    REGISTRY_STORAGE_FILESYSTEM_ROOTDIRECTORY = "/var/lib/registry";
  };

  labels = {
    "org.opencontainers.image.title" = "GitLab Container Registry";
    "org.opencontainers.image.description" = "Docker registry for GitLab";
    "org.opencontainers.image.version" = pkgs.gitlab-container-registry.version;
    "io.nix-containers.chart" = "gitlab";
  };
}
