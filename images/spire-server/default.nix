{ mkImage, pkgs, lib, ... }:

# SPIRE Server - SPIFFE Runtime Environment Server
# https://spiffe.io/

let
  # spire-server needs an HCL config to run. Bake the canonical quickstart
  # config at /etc/spire/server.conf (the Go binary ships no /etc, so no
  # shadowing): bind the API on 0.0.0.0:8081, an embedded sqlite DataStore +
  # in-memory KeyManager + join_token NodeAttestor (no external deps), with
  # data_dir under the writable /tmp mkImage provides. Operators mount their
  # own config (real trust_domain, upstream CA, k8s/x509 attestors, a PVC).
  serverConf = pkgs.writeTextDir "etc/spire/server.conf" ''
    server {
      bind_address  = "0.0.0.0"
      bind_port     = "8081"
      trust_domain  = "example.org"
      data_dir      = "/tmp/spire-data"
      log_level     = "INFO"
    }

    plugins {
      DataStore "sql" {
        plugin_data {
          database_type     = "sqlite3"
          connection_string = "/tmp/spire-data/datastore.sqlite3"
        }
      }

      KeyManager "memory" {
        plugin_data {}
      }

      NodeAttestor "join_token" {
        plugin_data {}
      }
    }
  '';

in
mkImage {
  drv = pkgs.spire-server;
  name = "spire-server";
  tag = "v${pkgs.spire-server.version}";
  entrypoint = [ "${pkgs.spire-server}/bin/spire-server" ];
  # Was `--help` (a one-shot). Run the server with the baked config; it serves
  # the gRPC/HTTP API on 0.0.0.0:8081 so the kind-test probe can reach it.
  cmd = [ "run" "-config" "/etc/spire/server.conf" ];

  extraPkgs = with pkgs; [ cacert serverConf ];

  labels = {
    "org.opencontainers.image.title" = "SPIRE Server";
    "org.opencontainers.image.description" = "SPIFFE Runtime Environment Server for identity attestation";
    "org.opencontainers.image.version" = pkgs.spire-server.version;
  };
}
