{ mkImage, pkgs, lib, ... }:

# Chainguard SBOM packages for consul:
# Packages available in nixpkgs:
#   pkgs.busybox  # busybox (1.37.0-r50)
#   pkgs.consul  # consul-1.22 (1.22.1-r0)
#   pkgs.curl  # curl (8.17.0-r0)
#   pkgs.dumb-init  # dumb-init (1.2.5-r9)
# Packages NOT in nixpkgs:
#   consul-1.22-oci-entrypoint (1.22.1-r0)
#   ld-linux (2.42-r4)

mkImage {
  drv = pkgs.consul;
  name = "consul";
  tag = "v${pkgs.consul.version}";
  entrypoint = [ "${pkgs.consul}/bin/consul" ];
  cmd = [ "agent" "-dev" "-client" "0.0.0.0" ];
  user = "0:0";  # consul typically needs root

  env = {
    CONSUL_DATA_DIR = "/consul/data";
    CONSUL_CONFIG_DIR = "/consul/config";
  };

  extraPkgs = with pkgs; [ curl dumb-init ];

  labels = {
    "org.opencontainers.image.title" = "Consul";
    "org.opencontainers.image.description" = "Tool for service discovery, monitoring and configuration";
    "org.opencontainers.image.version" = pkgs.consul.version;
    "io.nix-containers.chart" = "consul";
  };
}
