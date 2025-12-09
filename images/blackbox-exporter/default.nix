{ mkImage, pkgs, lib, ... }:


# Chainguard SBOM packages for blackbox-exporter:
# Packages available in nixpkgs:
#   pkgs.prometheus-blackbox-exporter  # prometheus-blackbox-exporter (0.28.0-r0)

mkImage {
  drv = pkgs.prometheus-blackbox-exporter;
  name = "blackbox-exporter";
  tag = "v${pkgs.prometheus-blackbox-exporter.version}";
  entrypoint = [ "${pkgs.prometheus-blackbox-exporter}/bin/blackbox_exporter" ];
  cmd = [ "--config.file=/etc/blackbox_exporter/config.yml" ];

  labels = {
    "org.opencontainers.image.title" = "Prometheus Blackbox Exporter";
    "org.opencontainers.image.description" = "Blackbox probing of endpoints over HTTP, HTTPS, DNS, TCP and ICMP";
    "org.opencontainers.image.version" = pkgs.prometheus-blackbox-exporter.version;
    "io.nix-containers.chart" = "kube-prometheus-stack";
  };
}
