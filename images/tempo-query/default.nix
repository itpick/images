# tempo-query
# =============
# Grafana Tempo Query - Jaeger query frontend for Tempo
# https://grafana.com/docs/tempo/latest/

{ mkImage, pkgs, lib, ... }:

# Chainguard SBOM packages for tempo-query:
# Packages available in nixpkgs:
#   pkgs.tempo  # tempo (2.9.0-r3)

mkImage {
  drv = pkgs.tempo;
  name = "tempo-query";
  tag = pkgs.tempo.version;
  entrypoint = [ "${pkgs.tempo}/bin/tempo-query" ];
  cmd = [];

  extraPkgs = with pkgs; [ cacert ];

  labels = {
    "org.opencontainers.image.title" = "Grafana Tempo Query";
    "org.opencontainers.image.description" = "Jaeger query frontend for Grafana Tempo";
    "org.opencontainers.image.version" = pkgs.tempo.version;
    "io.nix-containers.chart" = "tempo";
  };
}
