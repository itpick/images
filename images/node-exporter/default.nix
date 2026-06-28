{ mkImage, pkgs, lib, ... }:


# Chainguard SBOM packages for node-exporter:
# Packages available in nixpkgs:
#   pkgs.busybox  # busybox (1.37.0-r50)
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.libxcrypt  # libxcrypt (4.5.2-r0)
#   pkgs.prometheus-node-exporter  # prometheus-node-exporter (1.10.2-r3)
# Packages NOT in nixpkgs:
#   kube-logging-operator-custom-runner (0.13.0-r3)
#   kube-logging-operator-node-exporter (6.2.1-r0)
#   ld-linux (2.42-r4)
#   libcrypt1 (2.42-r4)

mkImage {
  drv = pkgs.prometheus-node-exporter;
  name = "node-exporter";
  tag = "v${pkgs.prometheus-node-exporter.version}";
  entrypoint = [ "${pkgs.prometheus-node-exporter}/bin/node_exporter" ];
  # Was `--help` (a one-shot). Serve the /metrics endpoint on 0.0.0.0:9100
  # (>1024, nonroot-bindable). node_exporter needs no config and contacts no
  # target — it reads the local /proc + /sys and serves immediately.
  cmd = [ "--web.listen-address=0.0.0.0:9100" ];

  extraPkgs = with pkgs; [
    busybox
  ];

  labels = {
    "org.opencontainers.image.title" = "Node Exporter";
    "org.opencontainers.image.description" = "Prometheus exporter for hardware and OS metrics";
    "org.opencontainers.image.version" = pkgs.prometheus-node-exporter.version;
    "io.nix-containers.chart" = "kube-prometheus-stack";
    "io.nix-containers.image.upstream" = "https://github.com/prometheus/node_exporter";
    "io.nix-containers.image.category" = "monitoring";
    "io.nix-containers.image.aliases" = "node-exporter,node_exporter,prometheus";
  };
}
