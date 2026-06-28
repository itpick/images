{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:


# Chainguard SBOM packages for nginx:
# Packages available in nixpkgs:
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.libxcrypt  # libxcrypt (4.5.2-r0)
#   pkgs.nginxmainline  # nginx-mainline (1.29.3-r0)
#   pkgs.zlib  # zlib (1.3.1-r51)
# Packages NOT in nixpkgs:
#   ld-linux (2.42-r4)
#   libcrypt1 (2.42-r4)
#   libcrypto3 (3.6.0-r4)
#   libpcre2-8-0 (10.47-r0)
#   libssl3 (3.6.0-r4)
#   nginx-mainline-config (1.29.3-r0)
#   nginx-mainline-package-config (1.29.3-r0)

let
  # nginx packages
  nginxPackages = with pkgs; [
    nginx
    bash
    coreutils
  ];

  # Use default non-root user environment
  userEnv = nonRoot.mkDefaultUserEnv pkgs [];

  # Minimal non-root server config. nginx's compile-time defaults bind :80
  # (privileged) and write the error log / pid under /var/log/nginx, which a
  # non-root, buildEnv-only image can't satisfy, so a bare image fails to
  # start (server-needs-config in KNOWN-LIMITATIONS). Listen on 8080 (>1024,
  # bindable by the nonroot user) and keep pid + temp dirs under writable
  # /tmp. Operators override by mounting their own /etc/nginx/nginx.conf.
  nginxConfig = pkgs.writeTextDir "etc/nginx/nginx.conf" ''
    worker_processes  1;
    error_log  /var/log/nginx/error.log warn;
    pid        /tmp/nginx.pid;

    events {
        worker_connections  1024;
    }

    http {
        access_log  /dev/stdout;

        client_body_temp_path  /tmp/nginx_client_body;
        proxy_temp_path        /tmp/nginx_proxy;
        fastcgi_temp_path      /tmp/nginx_fastcgi;
        uwsgi_temp_path        /tmp/nginx_uwsgi;
        scgi_temp_path         /tmp/nginx_scgi;

        server {
            listen       8080;
            server_name  localhost;
            location / {
                return 200 "ok\n";
            }
        }
    }
  '';

  # nginx (non-root) needs these to pre-exist writable: /tmp for the pid +
  # temp dirs (buildEnv otherwise leaves /tmp a read-only store symlink), and
  # /var/log/nginx owned by the nonroot uid for the error log. Mirrors the
  # sibling nginx-unprivileged image's writable-dirs scaffold.
  writableDirs = pkgs.runCommand "nginx-writable-dirs" {} ''
    mkdir -p $out/tmp
    mkdir -p $out/var/log/nginx
  '';

in
nix2container.buildImage {
  name = "nginx";
  # Version-tag the image (matches the org.opencontainers.image.version label).
  tag = pkgs.nginx.version;

  # Separate layers so the writable-dirs scaffold can declare its own perms
  # without colliding with buildEnv's read-only /tmp symlink (same approach as
  # nginx-unprivileged).
  layers = [
    (nix2container.buildLayer {
      copyToRoot = [
        (buildEnv {
          name = "nginx-root";
          paths = base.basePackages ++ nginxPackages ++ [ userEnv nginxConfig ];
        })
      ];
    })
    (nix2container.buildLayer {
      copyToRoot = [ writableDirs ];
      perms = [
        {
          path = writableDirs;
          regex = "/tmp";
          mode = "1777";
        }
        {
          path = writableDirs;
          regex = "/var/log/nginx";
          mode = "0755";
          uid = 65532;
          gid = 65532;
        }
      ];
    })
  ];

  config = nonRoot.defaultConfig // {
    User = "65532:65532";
    # Charts consuming nginx leave command/args unset, relying on the OCI
    # Entrypoint+Cmd; run nginx in the foreground with the baked config.
    Entrypoint = [ "${pkgs.nginx}/bin/nginx" ];
    Cmd = [ "-c" "/etc/nginx/nginx.conf" "-g" "daemon off;" ];
    ExposedPorts = {
      "8080/tcp" = {};
    };
    Env = base.defaultEnv ++ nonRoot.userEnv ++ [
      "PATH=${lib.makeBinPath nginxPackages}"
    ];
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.description" = "High-performance HTTP server and reverse proxy";
      "org.opencontainers.image.url" = "https://github.com/nix-containers/images";
      "org.opencontainers.image.source" = "https://github.com/nix-containers/images";
      "org.opencontainers.image.vendor" = "nix-containers";
      "org.opencontainers.image.version" = pkgs.nginx.version;
      "io.nix-containers.image.upstream" = "https://nginx.org/";
      "io.nix-containers.image.category" = "web-service";
      "io.nix-containers.image.aliases" = "nginx,webserver,proxy";
    };
  };
}
