{ mkImage, pkgs, lib, ... }:

# Chainguard SBOM packages for grafana-alloy:
# Packages available in nixpkgs:
#   pkgs.bash  # bash (5.3-r3)
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.grafana-alloy  # grafana-alloy (1.12.0-r1)
#   pkgs.libcap  # libcap (2.77-r0)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.ncurses  # ncurses (6.5_p20251025-r1)
# Packages NOT in nixpkgs:
#   ld-linux (2.42-r4)
#   libsystemd (258.2-r3)

let
  # The cmd points alloy at /etc/alloy/config.alloy, but nothing baked that file
  # — alloy exits ("cannot find the config file"). Bake a minimal valid config
  # (the Go binary ships no /etc, so no shadowing). Operators mount their own
  # config.alloy (a ConfigMap at /etc/alloy/config.alloy).
  alloyConfig = pkgs.writeTextDir "etc/alloy/config.alloy" ''
    // Minimal Alloy configuration: no collection components configured. Alloy
    // starts and serves its HTTP UI / metrics endpoint; mount your own
    // config.alloy at /etc/alloy/config.alloy with the pipelines you need.
    logging {
      level = "info"
    }
  '';

in
mkImage {
  drv = pkgs.grafana-alloy;
  name = "grafana-alloy";
  tag = "v${pkgs.grafana-alloy.version}";
  entrypoint = [ "${pkgs.grafana-alloy}/bin/alloy" ];
  # --storage.path defaults to the relative ./data-alloy (not writable on the
  # read-only nonroot root) and --server.http.listen-addr defaults to localhost
  # (unreachable by the kind-test probe); point storage at /tmp and bind
  # 0.0.0.0:12345.
  cmd = [
    "run" "/etc/alloy/config.alloy"
    "--storage.path=/tmp/alloy"
    "--server.http.listen-addr=0.0.0.0:12345"
  ];

  extraPkgs = with pkgs; [ bash alloyConfig ];

  labels = {
    "org.opencontainers.image.title" = "Grafana Alloy";
    "org.opencontainers.image.description" = "Open source OpenTelemetry Collector distribution with built-in Prometheus pipelines";
    "org.opencontainers.image.version" = pkgs.grafana-alloy.version;
    "io.nix-containers.chart" = "grafana-alloy";
  };
}
