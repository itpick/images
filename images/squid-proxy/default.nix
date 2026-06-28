{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# squid-proxy - Squid caching forward proxy
# http://www.squid-cache.org/

let
  imagePkgs = with pkgs; [
    squid
    bash
    coreutils
    cacert
    tzdata
  ];

  userEnv = nonRoot.mkDefaultUserEnv pkgs [];

  # Minimal non-root forward-proxy config. The stub had no Cmd and squid
  # refuses to start without a config. Memory-only (no cache_dir → no
  # `squid -z` cache init needed); pid + logs go to writable /tmp; run as the
  # image's nonroot user. Operators override by mounting their own
  # /etc/squid/squid.conf.
  squidConfig = pkgs.writeTextDir "etc/squid/squid.conf" ''
    http_port 0.0.0.0:3128
    http_access allow all
    cache deny all

    cache_effective_user nonroot
    pid_filename /tmp/squid.pid
    coredump_dir /tmp
    access_log stdio:/tmp/squid-access.log
    cache_log /tmp/squid-cache.log
  '';

  # squid writes its pid + logs under /tmp. buildEnv otherwise leaves /tmp a
  # read-only store symlink, so materialize it as a real writable dir (mirrors
  # the nginx/caddy scaffold).
  writableDirs = pkgs.runCommand "squid-writable-dirs" {} ''
    mkdir -p $out/tmp
  '';

in nix2container.buildImage {
  name = "squid-proxy";
  # Version-tag the image (matches the org.opencontainers.image.version label).
  tag = pkgs.squid.version;

  # Separate layers so the writable /tmp scaffold declares its own perms
  # without colliding with buildEnv's read-only /tmp symlink.
  layers = [
    (nix2container.buildLayer {
      copyToRoot = [
        (buildEnv {
          name = "squid-proxy-root";
          paths = base.basePackages ++ imagePkgs ++ [ userEnv squidConfig ];
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
    # Run squid in the foreground (-N = no daemon) with the baked config so the
    # kind probe reaches a Running pod with no extra wiring.
    Cmd = [ "squid" "-N" "-f" "/etc/squid/squid.conf" ];
    Env = base.defaultEnv ++ nonRoot.userEnv ++ [
      "PATH=${lib.makeBinPath imagePkgs}"
    ];
    ExposedPorts = {
      "3128/tcp" = {};
    };
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "squid-proxy";
      "org.opencontainers.image.description" = "Squid caching forward proxy";
      "org.opencontainers.image.version" = pkgs.squid.version;
      "io.nix-containers.image.upstream" = "http://www.squid-cache.org/";
      "io.nix-containers.image.category" = "web-service";
      "io.nix-containers.image.aliases" = "squid,squid-proxy,proxy,forward-proxy";
    };
  };
}
