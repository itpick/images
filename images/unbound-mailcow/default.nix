{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# unbound-mailcow - Unbound DNS resolver (mailcow's local resolver)
# https://nlnetlabs.nl/projects/unbound/

let
  unboundPackages = with pkgs; [
    unbound
    bash
    coreutils
    cacert
    tzdata
  ];

  # mkDefaultUserEnv provides /etc/passwd + /etc/group (nonroot, uid 65532) and a
  # writable /tmp (1777), which is all unbound needs below.
  userEnv = nonRoot.mkDefaultUserEnv pkgs [];

  # Minimal non-root resolver config. The stub had no Cmd, so its pod kind-test
  # fails with "no command specified". Listen on 0.0.0.0:5353 (>1024 so the
  # nonroot user can bind; operators wanting :53 add NET_BIND_SERVICE / run as
  # root), foreground (do-daemonize: no), no chroot (needs root) and no privilege
  # drop (username: "" — the container already runs as the nonroot uid), pid +
  # working dir on the writable /tmp, iterator-only so no DNSSEC trust-anchor
  # file is needed. Written to /etc/unbound.conf (a sibling path) — the unbound
  # package ships /etc/unbound/unbound.conf, which buildEnv would otherwise clash
  # with. Operators mount mailcow's own unbound config.
  unboundConfig = pkgs.writeTextDir "etc/unbound.conf" ''
    server:
        verbosity: 1
        interface: 0.0.0.0
        port: 5353
        do-daemonize: no
        do-ip6: no
        access-control: 0.0.0.0/0 allow
        chroot: ""
        username: ""
        directory: "/tmp"
        pidfile: "/tmp/unbound.pid"
        use-syslog: no
        logfile: ""
        module-config: "iterator"
  '';

in nix2container.buildImage {
  name = "unbound-mailcow";
  # Version-tag the image (matches the org.opencontainers.image.version label).
  tag = pkgs.unbound.version;
  copyToRoot = [
    (buildEnv {
      name = "unbound-mailcow-root";
      paths = base.basePackages ++ unboundPackages ++ [ userEnv unboundConfig ];
    })
  ];
  config = nonRoot.defaultConfig // {
    # Run the resolver in the foreground (-d) with the baked config so the kind
    # probe reaches a Running pod listening on 0.0.0.0:5353.
    Entrypoint = [ "${pkgs.unbound}/bin/unbound" ];
    Cmd = [ "-d" "-c" "/etc/unbound.conf" ];
    ExposedPorts = {
      "5353/tcp" = { };
      "5353/udp" = { };
    };
    Env = base.defaultEnv ++ nonRoot.userEnv ++ [
      "PATH=${lib.makeBinPath unboundPackages}"
    ];
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "unbound-mailcow";
      "org.opencontainers.image.description" = "Unbound validating, recursive, caching DNS resolver (mailcow local resolver)";
      "org.opencontainers.image.version" = pkgs.unbound.version;
    };
  };
}
