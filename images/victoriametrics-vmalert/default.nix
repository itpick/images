{ mkImage, pkgs, lib, ... }:

# VictoriaMetrics vmalert - alerting and recording rules executor
# https://docs.victoriametrics.com/vmalert/

let
  # vmalert requires -datasource.url and at least one -rule file, so cmd=[]
  # CrashLoops. Bake a minimal rules file (the Go binary ships no /etc, so no
  # shadowing). Use an ALERTING rule, not a recording rule: vmalert FATALs at
  # startup if a recording rule is present without -remoteWrite.url ("config
  # contains recording rules but -remoteWrite.url isn't set"), whereas an
  # alerting rule only needs a notifier (a placeholder is fine — vmalert just
  # can't deliver). vmalert evaluates on an interval (connecting to the
  # datasource/notifier lazily), so it starts and serves even though the
  # placeholders aren't reachable. Operators mount their own rules + set
  # -datasource.url / -notifier.url / -remoteWrite.url to their real endpoints.
  rulesConfig = pkgs.writeTextDir "etc/vmalert/rules.yml" ''
    groups:
    - name: example
      rules:
      - alert: AlwaysFiring
        expr: vector(1) > 0
        for: 0m
        labels:
          severity: none
        annotations:
          summary: placeholder alert
  '';
in
mkImage {
  drv = pkgs.victoriametrics;
  name = "victoriametrics-vmalert";
  tag = "v${pkgs.victoriametrics.version}";
  entrypoint = [ "${pkgs.victoriametrics}/bin/vmalert" ];
  # Run vmalert with a placeholder datasource + the baked rules; bind the HTTP
  # server on 0.0.0.0:8880 (its default -httpListenAddr) so the kind-test probe
  # can reach it.
  cmd = [
    "-datasource.url=http://localhost:8428"
    "-notifier.url=http://localhost:9093"
    "-rule=/etc/vmalert/rules.yml"
    "-httpListenAddr=0.0.0.0:8880"
  ];

  extraPkgs = with pkgs; [ cacert tzdata rulesConfig ];

  labels = {
    "org.opencontainers.image.title" = "VictoriaMetrics vmalert";
    "org.opencontainers.image.description" = "Executes alerting and recording rules";
    "org.opencontainers.image.version" = pkgs.victoriametrics.version;
    "io.nix-containers.chart" = "victoria-metrics-alert";
  };
}
