{ mkImage, pkgs, lib, ... }:


# Chainguard SBOM packages for prometheus:
# Packages available in nixpkgs:
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.prometheus  # prometheus-3.5 (3.5.0-r10)
# Packages NOT in nixpkgs:
#   ld-linux (2.42-r4)

let
  # Prometheus refuses to start without a config file (it defaults to
  # ./prometheus.yml in the cwd, which doesn't exist in the image). Bake a
  # minimal valid config — scrape just itself — at /etc/prometheus/prometheus.yml
  # (the Go binary ships no /etc, so no shadowing). Operators mount their own
  # config with real scrape targets.
  prometheusConfig = pkgs.writeTextDir "etc/prometheus/prometheus.yml" ''
    global:
      scrape_interval: 15s
    scrape_configs:
      - job_name: prometheus
        static_configs:
          - targets: ['localhost:9090']
  '';

in
mkImage {
  drv = pkgs.prometheus;
  name = "prometheus";
  tag = "v${pkgs.prometheus.version}";
  entrypoint = [ "${pkgs.prometheus}/bin/prometheus" ];
  # Was `--help` (a one-shot). Run the server with the baked config, bind the
  # web UI/API to 0.0.0.0:9090 so the kube-prometheus-stack / kind-test probe
  # can reach it, and keep the TSDB under the writable /tmp mkImage provides
  # (the default --storage.tsdb.path is relative to a non-writable cwd).
  cmd = [
    "--config.file=/etc/prometheus/prometheus.yml"
    "--storage.tsdb.path=/tmp/prometheus"
    "--web.listen-address=0.0.0.0:9090"
  ];

  extraPkgs = [ prometheusConfig ];

  env = {
    PROMETHEUS_DATA_DIR = "/prometheus";
  };

  labels = {
    "org.opencontainers.image.title" = "Prometheus";
    "org.opencontainers.image.description" = "Prometheus monitoring system and time series database";
    "org.opencontainers.image.version" = pkgs.prometheus.version;
    "io.nix-containers.chart" = "kube-prometheus-stack";
  };
}
