{ mkImage, pkgs, lib, ... }:

# CouchDB - Document-oriented NoSQL database
# https://couchdb.apache.org/

let
  # CouchDB 3 refuses to start without an admin ("No Admin Account Found,
  # aborting startup"), and its defaults bind 127.0.0.1 and write under
  # non-writable paths. Bake a minimal local.ini: a placeholder admin, the
  # data/view dirs under the writable /tmp, and bind 0.0.0.0:5984 so the
  # kind-test probe can reach it. The entrypoint copies this to a writable spot
  # (CouchDB hashes the plaintext admin password back into local.ini on first
  # boot). Operators mount their own local.ini (real admin, a PVC data dir).
  couchConfig = pkgs.writeTextDir "etc/couchdb/local.ini" ''
    [admins]
    admin = couchdb-dev-password

    [couchdb]
    database_dir = /tmp/couchdb/data
    view_index_dir = /tmp/couchdb/data

    [chttpd]
    bind_address = 0.0.0.0
    port = 5984
  '';

  # CouchDB is a two-file config + Erlang server; the entrypoint sets a writable
  # HOME (for .erlang.cookie), creates the data dir, copies local.ini somewhere
  # writable, then execs couchdb with the package default.ini + our local.ini.
  entrypoint = pkgs.writeShellApplication {
    name = "docker-entrypoint.sh";
    runtimeInputs = [ pkgs.couchdb3 pkgs.coreutils ];
    text = builtins.readFile ./docker-entrypoint.sh;
  };
in
mkImage {
  drv = pkgs.couchdb3;
  name = "couchdb";
  tag = "v${pkgs.couchdb3.version}";
  entrypoint = [ "${entrypoint}/bin/docker-entrypoint.sh" ];
  cmd = [];

  env = {
    COUCHDB_DEFAULT_INI = "${pkgs.couchdb3}/etc/default.ini";
  };

  extraPkgs = [ entrypoint couchConfig ];

  labels = {
    "org.opencontainers.image.title" = "CouchDB";
    "org.opencontainers.image.description" = "Document-oriented NoSQL database";
    "org.opencontainers.image.version" = pkgs.couchdb3.version;
  };
}
