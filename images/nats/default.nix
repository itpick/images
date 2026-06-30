{ mkImage, pkgs, lib, ... }:

# Chainguard SBOM packages for nats:
# Packages available in nixpkgs:
#   pkgs.nats-server  # nats-server (2.12.2-r1)

let
  # The cmd points --config at /etc/nats/nats-server.conf, but nothing baked
  # that file — nats-server exits ("error opening config file"). Bake a minimal
  # config there (the Go binary ships no /etc, so no shadowing): listen for
  # clients on 0.0.0.0:4222 and expose the HTTP monitoring endpoint on
  # 0.0.0.0:8222. No writable dir needed (no JetStream storage). Operators mount
  # their own config (JetStream, clustering, auth).
  natsConfig = pkgs.writeTextDir "etc/nats/nats-server.conf" ''
    listen: 0.0.0.0:4222
    http: 0.0.0.0:8222
  '';

in
mkImage {
  drv = pkgs.nats-server;
  name = "nats";
  tag = "v${pkgs.nats-server.version}";
  entrypoint = [ "${pkgs.nats-server}/bin/nats-server" ];
  cmd = [ "--config" "/etc/nats/nats-server.conf" ];

  extraPkgs = [ natsConfig ];

  labels = {
    "org.opencontainers.image.title" = "NATS";
    "org.opencontainers.image.description" = "High-Performance server for NATS messaging system";
    "org.opencontainers.image.version" = pkgs.nats-server.version;
    "io.nix-containers.chart" = "nats";
  };
}
