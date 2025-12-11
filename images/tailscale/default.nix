# tailscale
# =============
# Tailscale - Zero config VPN
# https://tailscale.com/
#
# Tailscale is a zero config VPN built on WireGuard that creates a
# secure network between your devices.

{ mkImage, pkgs, lib, ... }:

mkImage {
  drv = pkgs.tailscale;
  name = "tailscale";
  tag = "v${pkgs.tailscale.version}";
  entrypoint = [ "${pkgs.tailscale}/bin/tailscaled" ];
  cmd = [];

  extraPkgs = with pkgs; [
    iproute2
    iptables
    cacert
  ];

  labels = {
    "org.opencontainers.image.title" = "Tailscale";
    "org.opencontainers.image.description" = "Zero config VPN built on WireGuard";
    "org.opencontainers.image.version" = pkgs.tailscale.version;
  };
}
