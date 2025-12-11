# harbor-portal
# =============
# Harbor Portal - Web UI for Harbor registry
# https://github.com/goharbor/harbor

{ mkImage, nix2container, pkgs, lib, ... }:

# Harbor Portal is an nginx-based web frontend serving the Harbor UI

let
  version = "2.14.1";

  # Create a minimal nginx config for Harbor Portal
  nginxConfig = pkgs.writeText "nginx.conf" ''
    worker_processes auto;
    error_log /dev/stderr warn;
    pid /tmp/nginx.pid;

    events {
        worker_connections 1024;
    }

    http {
        include ${pkgs.nginx}/conf/mime.types;
        default_type application/octet-stream;

        log_format main '$remote_addr - $remote_user [$time_local] "$request" '
                        '$status $body_bytes_sent "$http_referer" '
                        '"$http_user_agent"';

        access_log /dev/stdout main;

        sendfile on;
        keepalive_timeout 65;

        server {
            listen 8080;
            server_name localhost;
            root /usr/share/nginx/html;

            location / {
                try_files $uri $uri/ /index.html;
            }

            location /api/ {
                proxy_pass http://core:8080/api/;
            }

            location /service/ {
                proxy_pass http://core:8080/service/;
            }

            location /v2/ {
                proxy_pass http://core:8080/v2/;
            }

            location /chartrepo/ {
                proxy_pass http://core:8080/chartrepo/;
            }

            location /c/ {
                proxy_pass http://core:8080/c/;
            }
        }
    }
  '';

in
nix2container.buildImage {
  name = "harbor-portal";
  tag = "v${version}";

  copyToRoot = pkgs.buildEnv {
    name = "harbor-portal-root";
    paths = with pkgs; [
      nginx
      cacert
      # Create directory structure
      (pkgs.runCommand "harbor-portal-dirs" {} ''
        mkdir -p $out/tmp
        mkdir -p $out/var/cache/nginx
        mkdir -p $out/var/log/nginx
        mkdir -p $out/usr/share/nginx/html
        mkdir -p $out/etc/nginx
        cp ${nginxConfig} $out/etc/nginx/nginx.conf
        # Placeholder index.html - in production, Harbor UI assets would be here
        echo '<!DOCTYPE html><html><head><title>Harbor</title></head><body><h1>Harbor Portal</h1><p>Harbor UI placeholder</p></body></html>' > $out/usr/share/nginx/html/index.html
      '')
    ];
    pathsToLink = [ "/bin" "/etc" "/lib" "/share" "/tmp" "/var" "/usr" ];
  };

  config = {
    entrypoint = [ "${pkgs.nginx}/bin/nginx" ];
    cmd = [ "-g" "daemon off;" "-c" "/etc/nginx/nginx.conf" ];
    exposedPorts = {
      "8080/tcp" = {};
    };
    labels = {
      "org.opencontainers.image.title" = "Harbor Portal";
      "org.opencontainers.image.description" = "Web UI for Harbor registry";
      "org.opencontainers.image.version" = version;
      "io.nix-containers.chart" = "harbor";
    };
  };
}
