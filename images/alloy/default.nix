{ mkImage, pkgs, lib, ... }:

mkImage {
  drv = pkgs.grafana-alloy;
  name = "alloy";
  tag = "v${pkgs.grafana-alloy.version}";
  entrypoint = [ "${pkgs.grafana-alloy}/bin/alloy" ];
  cmd = [ "--help" ];

  # From Chainguard SBOM (ncurses omitted due to /bin/clear collision with busybox)
  extraPkgs = with pkgs; [
    bash
    libcap
  ];

  labels = {
    "org.opencontainers.image.title" = "Grafana Alloy";
    "org.opencontainers.image.description" = "OpenTelemetry Collector distribution with programmable pipelines";
    "org.opencontainers.image.version" = pkgs.grafana-alloy.version;
    "io.nix-containers.chart" = "alloy";
  };
}
