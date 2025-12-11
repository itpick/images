# loki-canary
# =============
# Loki Canary is a test tool for Loki that writes logs and verifies they can be read back.
# It's part of the grafana-loki package in nixpkgs.

{ mkImage, pkgs, lib, ... }:


# Chainguard SBOM packages for loki-canary:
# Packages NOT in nixpkgs:
#   loki-3.6-loki-canary (3.6.2-r0)

mkImage {
  drv = pkgs.grafana-loki;
  name = "loki-canary";
  tag = pkgs.grafana-loki.version;
  entrypoint = [ "${pkgs.grafana-loki}/bin/loki-canary" ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "Loki Canary";
    "org.opencontainers.image.description" = "Test tool for Loki that writes and verifies logs";
    "org.opencontainers.image.version" = pkgs.grafana-loki.version;
    "io.nix-containers.chart" = "loki";
  };
}
