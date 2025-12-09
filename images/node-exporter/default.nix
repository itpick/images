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
  cmd = [ "--help" ];

  extraPkgs = with pkgs; [
    busybox
  ];

  labels = {
    "org.opencontainers.image.title" = "Node Exporter";
    "org.opencontainers.image.description" = "Prometheus exporter for hardware and OS metrics";
    "org.opencontainers.image.version" = pkgs.prometheus-node-exporter.version;
    "io.nix-containers.chart" = "kube-prometheus-stack";
  };
}
