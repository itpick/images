{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# nginx-unprivileged - runs as non-root user (65532)
# Same as nginx but configured to run without root privileges

let
  nginxPackages = with pkgs; [
    nginx
    bash
    coreutils
  ];

  userEnv = nonRoot.mkDefaultUserEnv pkgs [];

  # nginx's compile-time defaults (per `nginx -V`) require writing to:
  #   --error-log-path=/var/log/nginx/error.log
  #   --pid-path=/var/log/nginx/nginx.pid
  #   --http-client-body-temp-path=/tmp/nginx_client_body
  #   --http-proxy-temp-path=/tmp/nginx_proxy
  #   --http-fastcgi-temp-path=/tmp/nginx_fastcgi
  # As a non-root user, these paths need to pre-exist with the right
  # ownership/mode. buildEnv-only images don't create them, so the
  # container fails to start with:
  #   nginx: [alert] could not open error log file: ... No such file
  #   nginx: [emerg] mkdir() "/tmp/nginx_client_body" failed:
  #          Permission denied
  # Mirror the upstream nginxinc/nginx-unprivileged image layout:
  # /tmp world-writable (sticky, mode 1777), /var/log/nginx writable
  # by the nginx user (mode 0755 with owner 65532).
  writableDirs = pkgs.runCommand "nginx-writable-dirs" {} ''
    mkdir -p $out/tmp
    mkdir -p $out/var/log/nginx
    mkdir -p $out/var/cache/nginx
  '';

in
nix2container.buildImage {
  name = "nginx-unprivileged";
  tag = pkgs.nginx.version;

  # Use separate layers (not copyToRoot) so the writable-dirs scaffold
  # doesn't collide with buildEnv's /tmp symlink (bash/coreutils brings
  # one in via their default `passthru.passthru-paths`). Same approach
  # mkImage takes -- isolate the tmpDir layer so it can declare its own
  # perms.
  layers = [
    (nix2container.buildLayer {
      copyToRoot = [
        (buildEnv {
          name = "nginx-unprivileged-root";
          paths = base.basePackages ++ nginxPackages ++ [ userEnv ];
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
        {
          path = writableDirs;
          regex = "/var/cache/nginx";
          mode = "0755";
          uid = 65532;
          gid = 65532;
        }
      ];
    })
  ];

  config = nonRoot.defaultConfig // {
    User = "65532:65532";
    Env = base.defaultEnv ++ nonRoot.userEnv ++ [
      "PATH=${lib.makeBinPath nginxPackages}"
      "NGINX_ENTRYPOINT_QUIET_LOGS=1"
    ];
    # Charts that consume nginx as a plain webserver image typically
    # leave `command` and `args` unset on the container spec, relying on
    # the OCI Entrypoint+Cmd. Without these set, the container starts
    # with no command and fails with:
    #   failed to generate container spec: no command specified
    # Match the upstream nginxinc/nginx-unprivileged image's behavior
    # (run nginx in the foreground).
    Entrypoint = [ "${pkgs.nginx}/bin/nginx" ];
    Cmd = [ "-g" "daemon off;" ];
    ExposedPorts = {
      "8080/tcp" = {};
    };
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.description" = "nginx running as non-root user";
      "org.opencontainers.image.url" = "https://github.com/nix-containers/images";
      "org.opencontainers.image.source" = "https://github.com/nix-containers/images";
      "org.opencontainers.image.vendor" = "nix-containers";
      "org.opencontainers.image.version" = pkgs.nginx.version;
      "io.nix-containers.image.upstream" = "https://nginx.org/";
      "io.nix-containers.image.category" = "web-service";
      "io.nix-containers.image.aliases" = "nginx,webserver,proxy,unprivileged";
    };
  };
}
