{ mkImage, pkgs, lib, ... }:

# Chainguard SBOM packages for nats:
# Packages available in nixpkgs:
#   pkgs.nats-server  # nats-server (2.12.2-r1)

mkImage {
  drv = pkgs.nats-server;
  name = "nats";
  tag = "v${pkgs.nats-server.version}";
  entrypoint = [ "${pkgs.nats-server}/bin/nats-server" ];
  cmd = [ "--config" "/etc/nats/nats-server.conf" ];

  labels = {
    "org.opencontainers.image.title" = "NATS";
    "org.opencontainers.image.description" = "High-Performance server for NATS messaging system";
    "org.opencontainers.image.version" = pkgs.nats-server.version;
    "io.nix-containers.chart" = "nats";
  };
}
