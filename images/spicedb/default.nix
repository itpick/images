{ mkImage, pkgs, lib, ... }:

# SpiceDB - Open source permission database
# https://authzed.com/spicedb

mkImage {
  drv = pkgs.spicedb;
  name = "spicedb";
  tag = "v${pkgs.spicedb.version}";
  entrypoint = [ "${pkgs.spicedb}/bin/spicedb" ];
  # Was `version` (a one-shot, so the kind-test pod CrashLoops). Run the
  # permission server: `serve` with the in-memory datastore (the default
  # engine) needs no external CockroachDB/Postgres, and the gRPC API binds
  # :50051 (all interfaces) + metrics :9090, reachable by the kind-test probe.
  # --grpc-preshared-key is REQUIRED; ship a clearly-placeholder dev key.
  # Operators run production with --datastore-engine=postgres + a real key.
  cmd = [ "serve" "--grpc-preshared-key=spicedb-dev-preshared-key" "--datastore-engine=memory" ];

  extraPkgs = with pkgs; [
    grpc-health-probe
    cacert
  ];

  labels = {
    "org.opencontainers.image.title" = "SpiceDB";
    "org.opencontainers.image.description" = "Open source permission database inspired by Google Zanzibar";
    "org.opencontainers.image.version" = pkgs.spicedb.version;
  };
}
