{ mkImage, pkgs, lib, ... }:

# PgBouncer - PostgreSQL connection pooler
# https://www.pgbouncer.org/

let
  # PgBouncer needs a config to run. Bake a minimal one at
  # /etc/pgbouncer/pgbouncer.ini (the C binary ships no /etc, so no shadowing):
  # listen on 0.0.0.0:6432, auth_type=any (ignores the username, so NO auth_file
  # is required — unlike `trust`, which still needs the user listed there), with
  # the pidfile + unix socket under the writable /tmp. `any` requires each
  # database to log in as a specific user, so the wildcard points at a
  # placeholder localhost backend with user=pgbouncer. PgBouncer binds and stays
  # up even though that backend isn't reachable. Operators mount their own
  # pgbouncer.ini (real [databases], auth_file/auth_query).
  pgbouncerConfig = pkgs.writeTextDir "etc/pgbouncer/pgbouncer.ini" ''
    [databases]
    * = host=localhost port=5432 user=pgbouncer

    [pgbouncer]
    listen_addr = 0.0.0.0
    listen_port = 6432
    auth_type = any
    pidfile = /tmp/pgbouncer.pid
    unix_socket_dir = /tmp
  '';

in
mkImage {
  drv = pkgs.pgbouncer;
  name = "pgbouncer";
  tag = "v${pkgs.pgbouncer.version}";
  entrypoint = [ "${pkgs.pgbouncer}/bin/pgbouncer" ];
  # Was empty (no command). Run with the baked config; pgbouncer runs in the
  # foreground and serves the pooler on 0.0.0.0:6432.
  cmd = [ "/etc/pgbouncer/pgbouncer.ini" ];

  extraPkgs = with pkgs; [ pgbouncerConfig ];

  labels = {
    "org.opencontainers.image.title" = "PgBouncer";
    "org.opencontainers.image.description" = "Lightweight PostgreSQL connection pooler";
    "org.opencontainers.image.version" = pkgs.pgbouncer.version;
  };
}
