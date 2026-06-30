{ mkImage, pkgs, lib, ... }:

# Conduit - Matrix homeserver
# https://conduit.rs/

let
  # The def used `drv = pkgs.conduit`, but that is LLNL Conduit (a scientific
  # data-exchange library) — it ships no `conduit` server binary, so the image
  # was unrunnable. The Matrix homeserver this image is named/described for is
  # `pkgs.matrix-conduit`.
  #
  # matrix-conduit refuses to start without CONDUIT_CONFIG pointing at a TOML
  # config ("The CONDUIT_CONFIG env var needs to be set"). Bake a minimal one:
  # the embedded RocksDB store under the writable /tmp, and address 0.0.0.0
  # (default is 127.0.0.1) so the kind-test probe can reach :6167. Operators
  # mount their own conduit.toml (real server_name, persistent DB, TLS/proxy).
  conduitConfig = pkgs.writeTextDir "etc/conduit.toml" ''
    [global]
    server_name = "localhost"
    database_backend = "rocksdb"
    database_path = "/tmp/conduit"
    port = 6167
    address = "0.0.0.0"
    allow_registration = true
    allow_check_for_updates = false
  '';
in
mkImage {
  drv = pkgs.matrix-conduit;
  name = "conduit";
  tag = "v${pkgs.matrix-conduit.version}";
  entrypoint = [ "${pkgs.matrix-conduit}/bin/conduit" ];
  cmd = [];

  env = {
    CONDUIT_CONFIG = "/etc/conduit.toml";
  };

  extraPkgs = [ conduitConfig ];

  labels = {
    "org.opencontainers.image.title" = "Conduit";
    "org.opencontainers.image.description" = "Lightweight Matrix homeserver written in Rust";
    "org.opencontainers.image.version" = pkgs.matrix-conduit.version;
  };
}
