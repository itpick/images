{ mkImage, pkgs, lib, ... }:

# VictoriaMetrics vmagent - lightweight metrics collector
# https://docs.victoriametrics.com/vmagent/

mkImage {
  drv = pkgs.victoriametrics;
  name = "victoriametrics-vmagent";
  tag = "v${pkgs.victoriametrics.version}";
  entrypoint = [ "${pkgs.victoriametrics}/bin/vmagent" ];
  # vmagent requires at least one -remoteWrite.url or it exits, so cmd=[]
  # CrashLoops. Point it at a placeholder localhost remote (operators override
  # with their real VictoriaMetrics/Prometheus remote-write endpoint) — vmagent
  # buffers to -remoteWrite.tmpDataPath and retries, so it stays up with no
  # backend. Put the buffer under the writable /tmp (the default is a relative
  # dir the nonroot user can't create) and bind the HTTP server (metrics/health)
  # on 0.0.0.0:8429 so the kind-test probe can reach it.
  cmd = [
    "-remoteWrite.url=http://localhost:8428/api/v1/write"
    "-remoteWrite.tmpDataPath=/tmp/vmagent"
    "-httpListenAddr=0.0.0.0:8429"
  ];

  extraPkgs = with pkgs; [ cacert tzdata ];

  labels = {
    "org.opencontainers.image.title" = "VictoriaMetrics vmagent";
    "org.opencontainers.image.description" = "Lightweight metrics collector and scraper";
    "org.opencontainers.image.version" = pkgs.victoriametrics.version;
    "io.nix-containers.chart" = "victoria-metrics-agent";
  };
}
