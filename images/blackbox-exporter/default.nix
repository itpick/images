{ mkImage, pkgs, lib, ... }:


# Chainguard SBOM packages for blackbox-exporter:
# Packages available in nixpkgs:
#   pkgs.prometheus-blackbox-exporter  # prometheus-blackbox-exporter (0.28.0-r0)

let
  # The cmd points --config.file at /etc/blackbox_exporter/config.yml, but
  # nothing baked that file — the bare image failed to start ("error loading
  # config ... no such file"). Bake the standard minimal config (a single
  # http_2xx module) there (the Go binary ships no /etc, so no shadowing).
  # blackbox-exporter then serves /probe + /metrics on its default
  # 0.0.0.0:9115. Operators mount their own config with real probe modules.
  blackboxConfig = pkgs.writeTextDir "etc/blackbox_exporter/config.yml" ''
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
  name = "blackbox-exporter";
  tag = "v${pkgs.prometheus-blackbox-exporter.version}";
  entrypoint = [ "${pkgs.prometheus-blackbox-exporter}/bin/blackbox_exporter" ];
  cmd = [ "--config.file=/etc/blackbox_exporter/config.yml" ];

  extraPkgs = [ blackboxConfig ];

  labels = {
    "org.opencontainers.image.title" = "Prometheus Blackbox Exporter";
    "org.opencontainers.image.description" = "Blackbox probing of endpoints over HTTP, HTTPS, DNS, TCP and ICMP";
    "org.opencontainers.image.version" = pkgs.prometheus-blackbox-exporter.version;
    "io.nix-containers.chart" = "kube-prometheus-stack";
  };
}
