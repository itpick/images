{ mkImage, pkgs, lib, ... }:

# haproxy-nixchart
# ================
# HAProxy image for consumption by the charts/haproxy chart.
#
# Chart mounts haproxy.cfg via ConfigMap; image starts haproxy with it.
# Non-root; UID 1001.

let
  # Minimal config for standalone runs / kind smoke; chart mounts a real
  # config over the same path via ConfigMap.
  smokeConf = pkgs.writeText "haproxy.cfg" ''
    global
      daemon
    defaults
      mode http
      timeout connect 5s
      timeout client 30s
      timeout server 30s
    frontend http-in
      bind *:8080
      default_backend ok
    backend ok
      http-request return status 200 content-type text/plain string "ok"
  '';

  configRoot = pkgs.runCommand "haproxy-nixchart-config" {} ''
    mkdir -p $out/usr/local/etc/haproxy
    cp ${smokeConf} $out/usr/local/etc/haproxy/haproxy.cfg
  '';
in
mkImage {
  drv = pkgs.buildEnv {
    name = "haproxy-nixchart-env";
    paths = [ pkgs.haproxy configRoot pkgs.bash pkgs.coreutils pkgs.cacert ];
  };
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
