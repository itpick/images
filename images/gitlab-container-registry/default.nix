# gitlab-container-registry
# =============
# GitLab Container Registry - Docker registry for GitLab
# https://gitlab.com/gitlab-org/container-registry

{ mkImage, pkgs, lib, ... }:

# GitLab Container Registry is a fork of Docker Registry with GitLab integration

let
  # `registry serve` requires a config file, but nothing baked the
  # /etc/docker/registry/config.yml the cmd points at, so the image exited
  # immediately. The old env also forced the storage root to /var/lib/registry,
  # which is read-only on the image rootfs. Bake the canonical minimal config
  # (the Go binary ships no /etc, so no shadowing): filesystem storage under the
  # writable /tmp mkImage provides, and the HTTP API on 0.0.0.0:5000. Operators
  # mount their own config (real storage backend, metadata DB, auth, TLS) + a
  # PVC for the registry root.
  registryConfig = pkgs.writeTextDir "etc/docker/registry/config.yml" ''
    version: 0.1
    log:
      level: info
    storage:
      filesystem:
        rootdirectory: /tmp/registry
      delete:
        enabled: true
    http:
      addr: 0.0.0.0:5000
  '';

in
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
    registryConfig
  ];

  labels = {
    "org.opencontainers.image.title" = "GitLab Container Registry";
    "org.opencontainers.image.description" = "Docker registry for GitLab";
    "org.opencontainers.image.version" = pkgs.gitlab-container-registry.version;
    "io.nix-containers.chart" = "gitlab";
  };
}
