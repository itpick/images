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

mkImage {
  drv = pkgs.grafana-alloy;
  name = "grafana-alloy";
  tag = "v${pkgs.grafana-alloy.version}";
  entrypoint = [ "${pkgs.grafana-alloy}/bin/alloy" ];
  cmd = [ "run" "/etc/alloy/config.alloy" ];

  extraPkgs = with pkgs; [ bash ];

  labels = {
    "org.opencontainers.image.title" = "Grafana Alloy";
    "org.opencontainers.image.description" = "Open source OpenTelemetry Collector distribution with built-in Prometheus pipelines";
    "org.opencontainers.image.version" = pkgs.grafana-alloy.version;
    "io.nix-containers.chart" = "grafana-alloy";
  };
}
