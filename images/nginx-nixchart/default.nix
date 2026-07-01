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

let
  # Minimal config for standalone runs / kind smoke tests. Chart mounts
  # a real config over /etc/nginx/nginx.conf via ConfigMap; when that
  # happens, this default is shadowed.
  smokeConf = pkgs.writeText "nginx.conf" ''
    daemon off;
    pid /tmp/nginx.pid;
    error_log /tmp/nginx-error.log warn;
    events {}
    http {
      access_log /tmp/nginx-access.log;
      client_body_temp_path /tmp/nginx-client-body;
      proxy_temp_path /tmp/nginx-proxy;
      fastcgi_temp_path /tmp/nginx-fastcgi;
      uwsgi_temp_path /tmp/nginx-uwsgi;
      scgi_temp_path /tmp/nginx-scgi;
      server {
        listen 8080 default_server;
        location / { return 200 "ok\n"; }
      }
    }
  '';

  # Ship the default config into /etc/nginx and pre-create the writable
  # dirs nginx expects at boot time.
  nginxRoot = pkgs.runCommand "nginx-nixchart-root" {} ''
    mkdir -p $out/etc/nginx
    cp ${smokeConf} $out/etc/nginx/nginx.conf
  '';
in
mkImage {
  drv = pkgs.buildEnv {
    name = "nginx-nixchart-env";
    paths = with pkgs; [ nginx nginxRoot bash coreutils cacert tzdata ];
  };

  name = "nginx-nixchart";
  tag = "v${pkgs.nginx.version}";

  entrypoint = [ (lib.getExe pkgs.nginx) ];
  # Explicit -c so nginx uses our /etc/nginx/nginx.conf rather than
  # trying the nixpkgs baked-in path (points into the nix store's own
  # /nix/store/...-nginx-.../conf/, which doesn't include a config).
  cmd = [ "-c" "/etc/nginx/nginx.conf" ];

  user = "1001:0";

  labels = {
    "org.opencontainers.image.title" = "nginx-nixchart";
    "org.opencontainers.image.description" = "nginx image tuned for the nix-containers charts/nginx chart";
    "org.opencontainers.image.version" = pkgs.nginx.version;
    "io.nix-containers.chart" = "nginx";
  };
}
