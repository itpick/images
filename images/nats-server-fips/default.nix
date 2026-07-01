{ mkImage, pkgs, lib, ... }:

# nats-server-fips
# Container image packaging nixpkgs.nats-server

let
  # The cmd was `--help` (a one-shot, so the kind-test pod CrashLoops). Bake a
  # minimal config and run the server, mirroring the sibling `nats` image (same
  # pkgs.nats-server): listen for clients on 0.0.0.0:4222 and expose the HTTP
  # monitoring endpoint on 0.0.0.0:8222 (both reachable by the kind-test probe).
  # No writable dir needed (no JetStream storage). The Go binary ships no /etc,
  # so nothing shadows this. Operators mount their own config (JetStream,
  # clustering, auth).
  natsConfig = pkgs.writeTextDir "etc/nats/nats-server.conf" ''
    listen: 0.0.0.0:4222
    http: 0.0.0.0:8222
  '';
in
mkImage {
  drv = pkgs.nats-server;
  name = "nats-server-fips";
  tag = "v${pkgs.nats-server.version}";
  entrypoint = [ (lib.getExe pkgs.nats-server) ];
  cmd = [ "--config" "/etc/nats/nats-server.conf" ];

  extraPkgs = [ natsConfig ];

  labels = {
    "org.opencontainers.image.title" = "nats-server-fips";
    "org.opencontainers.image.description" = "nats-server-fips container image (nixpkgs.nats-server)";
    "org.opencontainers.image.version" = pkgs.nats-server.version;
    "io.nix-containers.source" = "nixpkgs";
  };
}
