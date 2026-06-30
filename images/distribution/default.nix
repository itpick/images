{ mkImage, pkgs, lib, ... }:

# Distribution - Docker registry implementation
# https://github.com/distribution/distribution

let
  # `registry serve` requires a config file, but nothing baked the
  # /etc/docker/registry/config.yml the cmd points at — the image exited. Bake
  # the canonical minimal config there (the Go binary ships no /etc, so no
  # shadowing): filesystem storage under the writable /tmp and the HTTP API on
  # 0.0.0.0:5000. Operators mount their own config (real storage backend, auth,
  # TLS) + a PVC for the registry root.
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
  drv = pkgs.distribution;
  name = "distribution";
  tag = "v${pkgs.distribution.version}";
  entrypoint = [ "${pkgs.distribution}/bin/registry" ];
  cmd = [ "serve" "/etc/docker/registry/config.yml" ];

  extraPkgs = with pkgs; [ cacert registryConfig ];

  labels = {
    "org.opencontainers.image.title" = "Distribution";
    "org.opencontainers.image.description" = "Docker registry implementation";
    "org.opencontainers.image.version" = pkgs.distribution.version;
  };
}
