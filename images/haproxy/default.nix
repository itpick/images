{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:


# Chainguard SBOM packages for haproxy:
# Packages available in nixpkgs:
#   pkgs.bash  # bash (5.3-r3)
#   pkgs.busybox  # busybox (1.37.0-r50)
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.haproxy  # haproxy-3.3 (3.3.0-r0)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.libxcrypt  # libxcrypt (4.5.2-r0)
#   pkgs.ncurses  # ncurses (6.5_p20251025-r1)
# Packages NOT in nixpkgs:
#   dataplaneapi (3.2.7-r1)
#   haproxy-3.3-oci-entrypoint (3.3.0-r0)
#   ld-linux (2.42-r4)
#   libcrypt1 (2.42-r4)
#   libcrypto3 (3.6.0-r4)
#   libpcre2-8-0 (10.47-r0)
#   libssl3 (3.6.0-r4)
#   lua5.3-libs (5.3.6-r11)
#   ncurses-terminfo-base (6.5_p20251025-r1)
#   posix-libc-utils (2.42-r4)

let
  haproxyPackages = with pkgs; [
    haproxy
    bash
    coreutils
  ];

  userEnv = nonRoot.mkDefaultUserEnv pkgs [];

  # haproxy refuses to start without a config (server-needs-config in
  # KNOWN-LIMITATIONS). Bake a minimal, non-root-friendly default: an HTTP
  # health frontend on 0.0.0.0:8080 (>1024, so the nonRoot user can bind it)
  # that answers /healthz via monitor-uri. No writable dirs, no chroot, logs
  # to stdout. Operators override by mounting their own /etc/haproxy/haproxy.cfg.
  haproxyConfig = pkgs.writeTextDir "etc/haproxy/haproxy.cfg" ''
    global
        log stdout format raw local0

    defaults
        mode http
        log global
        timeout connect 5s
        timeout client 50s
        timeout server 50s

    frontend health
        bind 0.0.0.0:8080
        monitor-uri /healthz
  '';

in
nix2container.buildImage {
  name = "haproxy";
  # Version-tag the image (matches the org.opencontainers.image.version label).
  tag = pkgs.haproxy.version;

  copyToRoot = [
    (buildEnv {
      name = "haproxy-root";
      paths = base.basePackages ++ haproxyPackages ++ [ userEnv haproxyConfig ];
    })
  ];

  config = nonRoot.defaultConfig // {
    # Run in the foreground (-db disables daemonization) with the baked config
    # so the kind-test probe can reach a Running pod with no extra wiring.
    Cmd = [ "haproxy" "-f" "/etc/haproxy/haproxy.cfg" "-db" ];
    Env = base.defaultEnv ++ nonRoot.userEnv ++ [
      "PATH=${lib.makeBinPath haproxyPackages}"
    ];
    ExposedPorts = {
      "80/tcp" = {};
      "443/tcp" = {};
      "8080/tcp" = {};
    };
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.description" = "High-performance TCP/HTTP load balancer";
      "org.opencontainers.image.url" = "https://github.com/nix-containers/images";
      "org.opencontainers.image.source" = "https://github.com/nix-containers/images";
      "org.opencontainers.image.vendor" = "nix-containers";
      "org.opencontainers.image.version" = pkgs.haproxy.version;
      "io.nix-containers.image.upstream" = "https://www.haproxy.org/";
      "io.nix-containers.image.category" = "web-service";
      "io.nix-containers.image.aliases" = "haproxy,loadbalancer,proxy,lb";
    };
  };
}