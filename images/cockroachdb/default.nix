{ mkImage, pkgs, lib, ... }:

# CockroachDB - Distributed SQL database
# https://www.cockroachlabs.com/

mkImage {
  drv = pkgs.cockroachdb;
  name = "cockroachdb";
  tag = "v${pkgs.cockroachdb.version}";
  entrypoint = [ "${pkgs.cockroachdb}/bin/cockroach" ];
  # `start-single-node` defaults its data dir to ./cockroach-data (relative to
  # the CWD, "/", which is read-only) and binds localhost — so the pod fails to
  # write its store / isn't reachable. Put the store on the writable /tmp mkImage
  # provides (cockroach creates it), and bind the SQL/RPC (26257) and web UI
  # (8080) on 0.0.0.0 so the kind-test probe and clients can reach them.
  # Operators mount a PVC and override --store.
  cmd = [
    "start-single-node"
    "--insecure"
    "--store=/tmp/cockroach-data"
    "--listen-addr=0.0.0.0:26257"
    "--http-addr=0.0.0.0:8080"
  ];

  extraPkgs = with pkgs; [ cacert ];

  labels = {
    "org.opencontainers.image.title" = "CockroachDB";
    "org.opencontainers.image.description" = "Distributed SQL database built on a transactional key-value store";
    "org.opencontainers.image.version" = pkgs.cockroachdb.version;
  };
}
