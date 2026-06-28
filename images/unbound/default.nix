{ mkImage, pkgs, nonRoot, ... }:

# unbound - validating, recursive, caching DNS resolver
# https://nlnetlabs.nl/projects/unbound/

let
  # unbound drops privileges at startup to its configured `username` (compiled
  # default "unbound") and fatals if that user can't be resolved — and mkImage
  # ships no /etc/passwd, so the lookup fails. Provide a passwd that maps the
  # "unbound" user to the SAME uid (65532) the container already runs as, so the
  # setuid is a no-op that succeeds regardless of how the config is read. A
  # minimal passwd-only derivation (just /etc) — mkDefaultUserEnv also ships a
  # /tmp symlink that collides with mkImage's writable /tmp layer.
  passwdEnv = pkgs.runCommand "unbound-passwd" {} ''
    mkdir -p $out/etc
    printf 'root:x:0:0:root:/root:/sbin/nologin\nunbound:x:65532:65532:unbound:/tmp:/sbin/nologin\n' > $out/etc/passwd
    printf 'root:x:0:\nunbound:x:65532:\n' > $out/etc/group
  '';

  # Minimal non-root resolver config. The stub ran `unbound --help` (a one-shot,
  # not a server). Listen on 0.0.0.0:5353 (>1024 so the nonroot user can bind;
  # operators wanting :53 add NET_BIND_SERVICE / run as root), no chroot (can't
  # as non-root), drop to the nonroot user (already the running uid), pid +
  # working dir on the writable /tmp mkImage provides, iterator-only so no
  # DNSSEC trust-anchor file is needed (recursive resolution uses unbound's
  # built-in root hints). Operators override by mounting their own config.
  #
  # NB: write to /etc/unbound.conf, NOT /etc/unbound/unbound.conf — the unbound
  # package ships its own /etc/unbound/unbound.conf and mkImage's application
  # layer (the package) overrides that exact path, shadowing a config placed
  # there. A sibling path is not shadowed, so unbound actually reads this one.
  unboundConfig = pkgs.writeTextDir "etc/unbound.conf" ''
    server:
        verbosity: 1
        interface: 0.0.0.0
        port: 5353
        do-daemonize: no
        do-ip6: no
        so-sndbuf: 0
        so-rcvbuf: 0
        access-control: 0.0.0.0/0 allow
        chroot: ""
        username: "unbound"
        directory: "/tmp"
        pidfile: "/tmp/unbound.pid"
        use-syslog: no
        logfile: ""
        module-config: "iterator"
  '';

in
mkImage {
  drv = pkgs.unbound;
  name = "unbound";
  # Version-tag the image (matches the org.opencontainers.image.version label).
  tag = pkgs.unbound.version;

  # Run the resolver in the foreground (-d) with the baked config so the kind
  # probe reaches a Running pod (was `unbound --help`, a one-shot).
  entrypoint = [ "unbound" ];
  cmd = [ "-d" "-c" "/etc/unbound.conf" ];
  extraContents = [ unboundConfig passwdEnv ];

  labels = {
    "org.opencontainers.image.title" = "unbound";
    "org.opencontainers.image.description" = "Validating, recursive, caching DNS resolver";
    "org.opencontainers.image.version" = pkgs.unbound.version;
    "io.nix-containers.image.upstream" = "https://nlnetlabs.nl/projects/unbound/";
    "io.nix-containers.image.category" = "networking";
    "io.nix-containers.image.aliases" = "unbound,dns,resolver";
  };

  user = nonRoot.userString;
}
