{ mkImage, pkgs, lib, ... }:

# openfga-fips
# Container image packaging nixpkgs.openfga
mkImage {
  drv = pkgs.openfga;
  name = "openfga-fips";
  tag = "v${pkgs.openfga.version}";
  entrypoint = [ (lib.getExe pkgs.openfga) ];
  # Was `--help` (a one-shot, so the kind-test pod CrashLoops). Run the server:
  # `run` starts the authorization engine with its defaults — HTTP on
  # 0.0.0.0:8080, gRPC on 0.0.0.0:8081, Prometheus metrics on 0.0.0.0:2112 (all
  # reachable by the probe) and the in-memory datastore, so no external DB or
  # writable dir is needed. Same package (pkgs.openfga) as the sibling `openfga`
  # image, whose kind-test validates this exact cmd. Operators set
  # --datastore-engine + OPENFGA_DATASTORE_URI for persistence.
  cmd = [ "run" ];

  labels = {
    "org.opencontainers.image.title" = "openfga-fips";
    "org.opencontainers.image.description" = "openfga-fips container image (nixpkgs.openfga)";
    "org.opencontainers.image.version" = pkgs.openfga.version;
    "io.nix-containers.source" = "nixpkgs";
  };
}
