{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# httpd - Apache HTTP Server
# https://httpd.apache.org/

let
  imagePkgs = with pkgs; [
    apacheHttpd
    bash
    coreutils
    cacert
    tzdata
  ];

  userEnv = nonRoot.mkDefaultUserEnv pkgs [];

  # Minimal non-root server config. Apache's compile-time defaults bind :80
  # (privileged) and write the pid + runtime mutex under the read-only store,
  # so a bare image can't start (the stub also had no Cmd / no apache at all).
  # Listen on 8080 (>1024, nonroot-bindable), load just the modules needed to
  # serve static files, keep pid + runtime dir on writable /tmp, log to
  # stdout/stderr, and serve the packaged htdocs. Operators override by mounting
  # their own /etc/httpd/httpd.conf.
  httpdConfig = pkgs.writeTextDir "etc/httpd/httpd.conf" ''
    ServerRoot "${pkgs.apacheHttpd}"
    Listen 8080

    LoadModule mpm_event_module modules/mod_mpm_event.so
    LoadModule unixd_module modules/mod_unixd.so
    LoadModule authz_core_module modules/mod_authz_core.so
    LoadModule authz_host_module modules/mod_authz_host.so
    LoadModule dir_module modules/mod_dir.so
    LoadModule log_config_module modules/mod_log_config.so

    ServerName localhost
    PidFile /tmp/httpd.pid
    DefaultRuntimeDir /tmp
    ErrorLog /dev/stderr
    LogFormat "%h %l %u %t \"%r\" %>s %b" common
    CustomLog /dev/stdout common

    DocumentRoot "${pkgs.apacheHttpd}/htdocs"
    <Directory "${pkgs.apacheHttpd}/htdocs">
        Require all granted
    </Directory>
    DirectoryIndex index.html
  '';

  # Apache writes its pid + runtime files under /tmp. buildEnv otherwise leaves
  # /tmp a read-only store symlink, so materialize it as a real writable dir.
  writableDirs = pkgs.runCommand "httpd-writable-dirs" {} ''
    mkdir -p $out/tmp
  '';

in nix2container.buildImage {
  name = "httpd";
  # Version-tag the image (matches the org.opencontainers.image.version label).
  tag = pkgs.apacheHttpd.version;

  # Separate layers so the writable /tmp scaffold declares its own perms
  # without colliding with buildEnv's read-only /tmp symlink.
  layers = [
    (nix2container.buildLayer {
      copyToRoot = [
        (buildEnv {
          name = "httpd-root";
          paths = base.basePackages ++ imagePkgs ++ [ userEnv httpdConfig ];
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
      ];
    })
  ];

  config = nonRoot.defaultConfig // {
    # Run httpd in the foreground with the baked config so the kind probe
    # reaches a Running pod with no extra wiring.
    Cmd = [ "httpd" "-f" "/etc/httpd/httpd.conf" "-DFOREGROUND" ];
    Env = base.defaultEnv ++ nonRoot.userEnv ++ [
      "PATH=${lib.makeBinPath imagePkgs}"
    ];
    ExposedPorts = {
      "8080/tcp" = {};
    };
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "httpd";
      "org.opencontainers.image.description" = "Apache HTTP Server";
      "org.opencontainers.image.version" = pkgs.apacheHttpd.version;
      "io.nix-containers.image.upstream" = "https://httpd.apache.org/";
      "io.nix-containers.image.category" = "web-service";
      "io.nix-containers.image.aliases" = "httpd,apache,apache2,webserver";
    };
  };
}
