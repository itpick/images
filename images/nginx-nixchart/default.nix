{ mkImage, pkgs, lib, ... }:

# nginx-nixchart
# ==============
# nginx image for consumption by the charts/nginx chart.
#
# The chart mounts a nginx.conf via a ConfigMap; the image just runs
# nginx in the foreground with that config. Users override via chart
# values (server-blocks, tls settings) — those flow to a mounted conf.
#
# Non-root; UID 1001.

mkImage {
  drv = pkgs.buildEnv {
    name = "nginx-nixchart-env";
    paths = with pkgs; [ nginx bash coreutils cacert tzdata ];
  };

  name = "nginx-nixchart";
  tag = "v${pkgs.nginx.version}";

  entrypoint = [ (lib.getExe pkgs.nginx) ];
  # Run in foreground with the chart-provided config (or nixpkgs default).
  cmd = [ "-g" "daemon off;" ];

  user = "1001:0";

  labels = {
    "org.opencontainers.image.title" = "nginx-nixchart";
    "org.opencontainers.image.description" = "nginx image tuned for the nix-containers charts/nginx chart";
    "org.opencontainers.image.version" = pkgs.nginx.version;
    "io.nix-containers.chart" = "nginx";
  };
}
