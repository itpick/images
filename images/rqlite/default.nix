{ mkImage, pkgs, lib, ... }:

# rqlite - Distributed relational database
# https://rqlite.io/

mkImage {
  drv = pkgs.rqlite;
  name = "rqlite";
  tag = "v${pkgs.rqlite.version}";
  entrypoint = [ "${pkgs.rqlite}/bin/rqlited" ];
  # Was `-node-id node1 /data`, which CrashLoops two ways in a nonroot pod:
  #  (1) the data dir /data can't be created on the read-only root
  #      ("mkdir /data: read-only file system") — put it under the writable /tmp;
  #  (2) -http-addr defaults to localhost:4001 (unreachable by the kind-test
  #      probe). Bind 0.0.0.0 for the HTTP API + Raft, but rqlite rejects
  #      0.0.0.0 as an *advertised* address ("not routable"), so advertise
  #      127.0.0.1 — fine for this single-node (-node-id node1, no peers) image.
  # Operators mount a PVC for the data dir and set -http-adv-addr/-raft-adv-addr
  # to the pod's routable address (e.g. $HOSTNAME) when forming a cluster.
  cmd = [
    "-node-id" "node1"
    "-http-addr" "0.0.0.0:4001" "-http-adv-addr" "127.0.0.1:4001"
    "-raft-addr" "0.0.0.0:4002" "-raft-adv-addr" "127.0.0.1:4002"
    "/tmp/rqlite"
  ];

  extraPkgs = with pkgs; [ cacert ];

  labels = {
    "org.opencontainers.image.title" = "rqlite";
    "org.opencontainers.image.description" = "Lightweight distributed relational database built on SQLite";
    "org.opencontainers.image.version" = pkgs.rqlite.version;
  };
}
