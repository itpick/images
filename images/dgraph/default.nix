{ mkImage, pkgs, lib, ... }:

# Dgraph - Distributed graph database
# https://dgraph.io/

let
  # Dgraph is a two-process server: `dgraph zero` (cluster coordinator) + `dgraph
  # alpha` (data node). The cmd was `--help` (a one-shot, so the kind-test pod
  # CrashLoops). Use a docker-entrypoint that runs both in one container (the
  # upstream "standalone" layout): start zero, wait for it, then exec alpha —
  # data under the writable /tmp, alpha serving HTTP :8080 + gRPC :9080.
  entrypoint = pkgs.writeShellApplication {
    name = "docker-entrypoint.sh";
    runtimeInputs = [ pkgs.dgraph ];
    text = builtins.readFile ./docker-entrypoint.sh;
  };
in
mkImage {
  drv = pkgs.dgraph;
  name = "dgraph";
  tag = "v${pkgs.dgraph.version}";
  entrypoint = [ "${entrypoint}/bin/docker-entrypoint.sh" ];
  cmd = [];

  extraPkgs = [ entrypoint ];

  labels = {
    "org.opencontainers.image.title" = "Dgraph";
    "org.opencontainers.image.description" = "Native GraphQL database with a graph backend";
    "org.opencontainers.image.version" = pkgs.dgraph.version;
  };
}
