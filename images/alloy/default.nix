{ mkImage, pkgs, lib, ... }:

let
  # alloy needs a config to run. Bake a minimal valid one (just a logging block,
  # no pipeline components) at /etc/alloy/config.alloy (package ships no /etc, so
  # no shadowing), so the image starts and serves its UI/API out of the box.
  # Operators mount their own config with real components.
  alloyConfig = pkgs.writeTextDir "etc/alloy/config.alloy" ''
    logging {
      level  = "info"
      format = "logfmt"
    }
  '';

in
mkImage {
  drv = pkgs.grafana-alloy;
  name = "alloy";
  tag = "v${pkgs.grafana-alloy.version}";
  entrypoint = [ "${pkgs.grafana-alloy}/bin/alloy" ];
  # Was `--help` (a one-shot). Run with the baked config; bind the HTTP server
  # to 0.0.0.0:12345 and keep the WAL/storage under the writable /tmp mkImage
  # provides.
  cmd = [
    "run"
    "/etc/alloy/config.alloy"
    "--server.http.listen-addr=0.0.0.0:12345"
    "--storage.path=/tmp/alloy"
  ];

  # From Chainguard SBOM (ncurses omitted due to /bin/clear collision with busybox)
  extraPkgs = [
    pkgs.bash
    pkgs.libcap
    alloyConfig
  ];

  labels = {
    "org.opencontainers.image.title" = "Grafana Alloy";
    "org.opencontainers.image.description" = "OpenTelemetry Collector distribution with programmable pipelines";
    "org.opencontainers.image.version" = pkgs.grafana-alloy.version;
    "io.nix-containers.chart" = "alloy";
  };
}
