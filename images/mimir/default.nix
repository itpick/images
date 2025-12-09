{ mkImage, pkgs, lib, ... }:


# Chainguard SBOM packages for mimir:
# Packages NOT in nixpkgs:
#   grafana-mimir (3.0.1-r1)

mkImage {
  drv = pkgs.mimir;
  name = "mimir";
  tag = "v${pkgs.mimir.version}";
  entrypoint = [ "${pkgs.mimir}/bin/mimir" ];
  cmd = [ "-config.file=/etc/mimir/mimir.yaml" ];

  labels = {
    "org.opencontainers.image.title" = "Grafana Mimir";
    "org.opencontainers.image.description" = "Scalable long-term storage for Prometheus";
    "org.opencontainers.image.version" = pkgs.mimir.version;
    "io.nix-containers.chart" = "mimir-distributed";
  };
}
