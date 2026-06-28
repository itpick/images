{ mkImage, pkgs, lib, ... }:

# Prometheus Blackbox Exporter
# https://github.com/prometheus/blackbox_exporter

let
  # blackbox_exporter refuses to start without --config.file. Bake a minimal
  # default with the standard http_2xx module so the image runs out of the box;
  # the exporter only probes a target when /probe is hit, so it needs no
  # connection at startup. Operators mount their own /etc/blackbox/blackbox.yml.
  blackboxConfig = pkgs.writeTextDir "etc/blackbox/blackbox.yml" ''
    modules:
      http_2xx:
        prober: http
        timeout: 5s
        http:
          preferred_ip_protocol: ip4
  '';

in
mkImage {
  drv = pkgs.prometheus-blackbox-exporter;
  name = "prometheus-blackbox-exporter";
  tag = "v${pkgs.prometheus-blackbox-exporter.version}";
  entrypoint = [ "${pkgs.prometheus-blackbox-exporter}/bin/blackbox_exporter" ];
  # Was `--help` (a one-shot). Serve on 0.0.0.0:9115 with the baked config.
  cmd = [
    "--config.file=/etc/blackbox/blackbox.yml"
    "--web.listen-address=0.0.0.0:9115"
  ];

  extraPkgs = [ pkgs.cacert blackboxConfig ];

  labels = {
    "org.opencontainers.image.title" = "Prometheus Blackbox Exporter";
    "org.opencontainers.image.description" = "Blackbox probing of endpoints over HTTP, HTTPS, DNS, TCP and ICMP";
    "org.opencontainers.image.version" = pkgs.prometheus-blackbox-exporter.version;
    "io.nix-containers.image.upstream" = "https://github.com/prometheus/blackbox_exporter";
    "io.nix-containers.image.category" = "monitoring";
    "io.nix-containers.image.aliases" = "blackbox-exporter,blackbox_exporter,prometheus";
  };
}
