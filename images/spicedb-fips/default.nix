{ mkImage, pkgs, lib, ... }:

# spicedb-fips
# Container image packaging nixpkgs.spicedb
mkImage {
  drv = pkgs.spicedb;
  name = "spicedb-fips";
  tag = "v${pkgs.spicedb.version}";
  entrypoint = [ (lib.getExe pkgs.spicedb) ];
  # Was `--help` (a one-shot, so the kind-test pod CrashLoops). Run the
  # permission server: `serve` with the in-memory datastore (the default
  # engine) needs no external CockroachDB/Postgres, and the gRPC API binds
  # :50051 (all interfaces) + metrics :9090, reachable by the kind-test probe.
  # --grpc-preshared-key is REQUIRED; ship a clearly-placeholder dev key. Same
  # package (pkgs.spicedb) as the sibling `spicedb` image, whose kind-test
  # validates this exact cmd. Operators run --datastore-engine=postgres + a key.
  cmd = [ "serve" "--grpc-preshared-key=spicedb-dev-preshared-key" "--datastore-engine=memory" ];

  labels = {
    "org.opencontainers.image.title" = "spicedb-fips";
    "org.opencontainers.image.description" = "spicedb-fips container image (nixpkgs.spicedb)";
    "org.opencontainers.image.version" = pkgs.spicedb.version;
    "io.nix-containers.source" = "nixpkgs";
  };
}
