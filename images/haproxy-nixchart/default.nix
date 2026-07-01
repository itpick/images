{ mkImage, pkgs, lib, ... }:

# haproxy-nixchart
# ================
# HAProxy image for consumption by the charts/haproxy chart.
#
# Chart mounts haproxy.cfg via ConfigMap; image starts haproxy with it.
# Non-root; UID 1001.

mkImage {
  drv = pkgs.haproxy;
  name = "haproxy-nixchart";
  tag = "v${pkgs.haproxy.version}";

  entrypoint = [ (lib.getExe pkgs.haproxy) ];
  cmd = [ "-f" "/usr/local/etc/haproxy/haproxy.cfg" "-W" "-db" ];

  user = "1001:0";

  labels = {
    "org.opencontainers.image.title" = "haproxy-nixchart";
    "org.opencontainers.image.description" = "HAProxy image tuned for the nix-containers charts/haproxy chart";
    "org.opencontainers.image.version" = pkgs.haproxy.version;
    "io.nix-containers.chart" = "haproxy";
  };
}
