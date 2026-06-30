{ mkImage, pkgs, lib, ... }:

# OpenFGA - High performance authorization/permission engine
# https://openfga.dev/

mkImage {
  drv = pkgs.openfga;
  name = "openfga";
  tag = "v${pkgs.openfga.version}";
  entrypoint = [ "${pkgs.openfga}/bin/openfga" ];
  # Was `version` (a one-shot that exits, so the kind-test pod CrashLoops).
  # Run the server: `run` starts the authorization engine with its defaults,
  # which already serve HTTP on 0.0.0.0:8080, gRPC on 0.0.0.0:8081 and Prom
  # metrics on 0.0.0.0:2112 (all reachable by the kind-test probe) and use the
  # in-memory datastore — no external Postgres/MySQL or writable dir required.
  # Operators set --datastore-engine + OPENFGA_DATASTORE_URI for persistence.
  cmd = [ "run" ];

  extraPkgs = with pkgs; [
    grpc-health-probe
    cacert
  ];

  labels = {
    "org.opencontainers.image.title" = "OpenFGA";
    "org.opencontainers.image.description" = "High performance and flexible authorization/permission engine inspired by Google Zanzibar";
    "org.opencontainers.image.version" = pkgs.openfga.version;
  };
}
